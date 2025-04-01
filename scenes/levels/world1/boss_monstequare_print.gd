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
		if ModeManager.is_savefile1:
			if SaveFileManager.currentplayerlives == 1 or SaveFileManager.currentplayerlives == 2 or SaveFileManager.currentplayerlives == 3 or SaveFileManager.currentplayerlives == 4 or SaveFileManager.currentplayerlives == 5 or SaveFileManager.currentplayerlives == 6 or SaveFileManager.currentplayerlives == 7 or SaveFileManager.currentplayerlives == 8 or SaveFileManager.currentplayerlives == 9:
				score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
			if SaveFileManager.currentplayerlivest == 1 or SaveFileManager.currentplayerlivest == 2 or SaveFileManager.currentplayerlivest == 3 or SaveFileManager.currentplayerlivest == 4 or SaveFileManager.currentplayerlivest == 5 or SaveFileManager.currentplayerlivest == 6 or SaveFileManager.currentplayerlivest == 7 or SaveFileManager.currentplayerlivest == 8 or SaveFileManager.currentplayerlivest == 9:
				score_numbers_life_t.animation = str(SaveFileManager.currentplayerlivest)
				score_numbers_life_dark_t.animation = str(SaveFileManager.currentplayerlivest)
				score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
		if ModeManager.is_savefile2:
			if SaveFileManager2.currentplayerlives == 1 or SaveFileManager2.currentplayerlives == 2 or SaveFileManager2.currentplayerlives == 3 or SaveFileManager2.currentplayerlives == 4 or SaveFileManager2.currentplayerlives == 5 or SaveFileManager2.currentplayerlives == 6 or SaveFileManager2.currentplayerlives == 7 or SaveFileManager2.currentplayerlives == 8 or SaveFileManager2.currentplayerlives == 9:
				score_numbers_life_u.animation = str(SaveFileManager2.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager2.currentplayerlives)
			if SaveFileManager2.currentplayerlivest == 1 or SaveFileManager2.currentplayerlivest == 2 or SaveFileManager2.currentplayerlivest == 3 or SaveFileManager2.currentplayerlivest == 4 or SaveFileManager2.currentplayerlivest == 5 or SaveFileManager2.currentplayerlivest == 6 or SaveFileManager2.currentplayerlivest == 7 or SaveFileManager2.currentplayerlivest == 8 or SaveFileManager2.currentplayerlivest == 9:
				score_numbers_life_t.animation = str(SaveFileManager2.currentplayerlivest)
				score_numbers_life_dark_t.animation = str(SaveFileManager2.currentplayerlivest)
				score_numbers_life_u.animation = str(SaveFileManager2.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager2.currentplayerlives)
		if ModeManager.is_savefile3:
			if SaveFileManager3.currentplayerlives == 1 or SaveFileManager3.currentplayerlives == 2 or SaveFileManager3.currentplayerlives == 3 or SaveFileManager3.currentplayerlives == 4 or SaveFileManager3.currentplayerlives == 5 or SaveFileManager3.currentplayerlives == 6 or SaveFileManager3.currentplayerlives == 7 or SaveFileManager3.currentplayerlives == 8 or SaveFileManager3.currentplayerlives == 9:
				score_numbers_life_u.animation = str(SaveFileManager3.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager3.currentplayerlives)
			if SaveFileManager3.currentplayerlivest == 1 or SaveFileManager3.currentplayerlivest == 2 or SaveFileManager3.currentplayerlivest == 3 or SaveFileManager3.currentplayerlivest == 4 or SaveFileManager3.currentplayerlivest == 5 or SaveFileManager3.currentplayerlivest == 6 or SaveFileManager3.currentplayerlivest == 7 or SaveFileManager3.currentplayerlivest == 8 or SaveFileManager3.currentplayerlivest == 9:
				score_numbers_life_t.animation = str(SaveFileManager3.currentplayerlivest)
				score_numbers_life_dark_t.animation = str(SaveFileManager3.currentplayerlivest)
				score_numbers_life_u.animation = str(SaveFileManager3.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager3.currentplayerlives)

func _process(delta: float) -> void:
	if LevelsManager.levelname == "boss_mostequare" && ModeManager.is_story:
		if game_manager.startouched:
			SaveFileManager.world1_boss_dic["hasbeencompleted"] = true
