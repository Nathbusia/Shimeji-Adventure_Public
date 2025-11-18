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

var randomchance = RandomNumberGenerator.new()

@onready var game_manager: GameManager = $GameManager

#Interfly thing
@onready var interflyhelper = preload("res://scenes/characters/npc/interfly_email_giver.tscn")
var interfly_path = ""
var interfly_spawn = false
var there_email = false
var interfly_visited = false
var setup_interfly = true
var no_email = true
@onready var get_interfly: Timer = $InterflySpawn/Get_Interfly
@onready var get_interfly_long: Timer = $InterflySpawn/Get_Interfly_Long
@onready var spawn_interfly_Right: Marker2D = $InterflySpawn/SpawnInterfly_Right
@onready var spawn_interfly_Left: Marker2D = $InterflySpawn/SpawnInterfly_Left

func _ready() -> void:
	print_tree_pretty()
	
	if AltBgmManager.enabled:
		$SceneObjects/Level_BGM.stream = load("res://bgm/levels/world2/bgm_world2_boss_ytsafe.ogg")
		$SceneObjects/Level_BossClear.stream = load ("res://bgm/levels/world2/bgm_world2_boss_end_ytsafe.ogg")
		$SceneObjects/Level_BGM.play()
	else:
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

	match LanguageManager.language:
		"japanese":
			$UI/GUI/BossUIBase/BossHealth/BossName.text = "ポップアウトピート"
		_:
			return
			#Just English.

func _process(delta: float) -> void:

	var overlapping_objects = $InterflyGoByeBye.get_overlapping_areas()
		
	for area in overlapping_objects:
		if area.get_parent().is_in_group("interflygiver"):
			get_interfly_long.start()
			area.get_parent().queue_free()

	if LevelsManager.levelname == "boss_pete" && ModeManager.is_story:
		if game_manager.startouched:
			SaveFileManager.world2_boss_dic["hasbeencompleted"] = true
			game_manager.startouched = false


func _on_get_interfly_timeout() -> void:
	if not game_manager.boss_defeat:
		var scene = get_node("SceneObjects")
		var Interfly = interflyhelper.instantiate()
		var spawnposchance = randomchance.randi_range(1, 10)
		if spawnposchance >= 5:
			Interfly.facing_right = true
			Interfly.global_position = spawn_interfly_Left.global_position
		else:
			Interfly.global_position = spawn_interfly_Right.global_position
		scene.add_child(Interfly)
		interfly_spawn = true
		interfly_visited = true
		get_interfly.stop()
	


func _on_get_interfly_long_timeout() -> void:
	if not game_manager.boss_defeat:
		var scene = get_node("SceneObjects")
		var Interfly = interflyhelper.instantiate()
		var spawnposchance = randomchance.randi_range(1, 10)
		if spawnposchance >= 5:
			Interfly.facing_right = true
			Interfly.global_position = spawn_interfly_Left.global_position
		else:
			Interfly.global_position = spawn_interfly_Right.global_position
		scene.add_child(Interfly)
		interfly_spawn = true
		interfly_visited = true
		get_interfly_long.stop()
