extends Node
class_name GameManager

@onready var score_numbers_h: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/Numbers/Score_NumbersH"
@onready var score_numbers_t: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/Numbers/Score_NumbersT"
@onready var score_numbers_u: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/Numbers/Score_NumbersU"
@onready var score_numbers_life_t: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeT"
@onready var score_numbers_life_u: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeU"
@onready var score_char_health: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/Health/Score_CharHealth"
@onready var triangle_counter_1: AnimatedSprite2D = $"../UI/GUI/SecretUIBase/TriangleCounter1"
@onready var triangle_counter_2: AnimatedSprite2D = $"../UI/GUI/SecretUIBase/TriangleCounter2"
@onready var triangle_counter_3: AnimatedSprite2D = $"../UI/GUI/SecretUIBase/TriangleCounter3"
@onready var triangle_counter_4: AnimatedSprite2D = $"../UI/GUI/SecretUIBase/TriangleCounter4"
@onready var shimeji_character_playable: CharacterBody2D = $"../SceneObjects/ShimejiCharacter_Playable"
@onready var scene_objects: Node = $"../SceneObjects"
@onready var boss_health_bar: AnimatedSprite2D = $"../UI/GUI/BossUIBase/BossHealth/Boss_HealthBar"

#Checkpoint Thing
var current_checkpoint : Checkpoint
var player : CharacterBody2D

#Character UI Thing
@onready var char_name: Label = $"../UI/GUI/CharUIBase/LayoutNameBG/CharName"
@onready var texture_rect: TextureRect = $"../UI/GUI/CharUIBase/LayoutNameBG/TextureRect"
@onready var score_layout_bg_2: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/Score_LayoutBG2"
@onready var score_char_portrait: TextureRect = $"../UI/GUI/CharUIBase/CharPanel/Score_CharPortrait"
@onready var score_char_life: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/Score_CharLife"
@onready var score_ex: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/Ex/Score_Ex"
@onready var score_ex_life: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/ExLife/Score_ExLife"

#Character UI (Dark Mode) Thing
@onready var texture_rect_dark: TextureRect = $"../UI/GUI/CharUIBase/LayoutNameBG/TextureRectDark"
@onready var score_layout_bg_dark: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/Score_LayoutBGDark"
@onready var score_ex_dark: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/Ex/Score_ExDark"
@onready var score_numbers_dark_h: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/Numbers/Score_NumbersDarkH"
@onready var score_numbers_dark_t: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/Numbers/Score_NumbersDarkT"
@onready var score_numbers_dark_u: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/Numbers/Score_NumbersDarkU"
@onready var score_ex_life_dark: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/ExLife/Score_ExLifeDark"
@onready var score_numbers_life_dark_t: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkT"
@onready var score_numbers_life_dark_u: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkU"
@onready var score_char_health_dark: AnimatedSprite2D = $"../UI/GUI/CharUIBase/LayoutMain/Health/Score_CharHealthDark"
@onready var char_name_dark: Label = $"../UI/GUI/CharUIBase/LayoutNameBG/CharNameDark"


#Multiple Playable Character thing.
var player_character_path = "res://scenes/characters/playable/" + CharactersManager.charactername + "/shimeji_character_playable.tscn"
var player_character_mod_path = "res://mods/characters/" + CharactersManager.charactername + "/scene/shimeji_character_playable.tscn"
@onready var ShimejiCharacter_Playable : CharacterBody2D
@onready var ShimejiCharacter_PlayableMod : CharacterBody2D
@onready var character_spawn: Node2D = $"../CharacterSpawn"
var is_ingame = false
var cam_ingame = true
var is_incutscene = false

#Level BGM thing
@onready var level_bgm: AudioStreamPlayer = $"../SceneObjects/Level_BGM"
@onready var level_boss_clear: AudioStreamPlayer = $"../SceneObjects/Level_BossClear"

#BossEndThings
@onready var boss_finish_screen: Panel = $"../UI/GUI/BossFinishScreen"
@onready var boss_finish_screen_anim: AnimationPlayer = $"../UI/GUI/BossFinishScreen/BossFinishScreen"


#Tutorial Cutscene Stuff
@onready var cutscene_tutorial_double_jump: Area2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_DoubleJump"
@onready var tutorial_doublejump_collision: CollisionShape2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_DoubleJump/CollisionShape2D"
@onready var cutscene_tutorial_triangles: Area2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_Triangles"
@onready var tutorial_triangles_collision: CollisionShape2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_Triangles/CollisionShape2D"
@onready var cutscene_tutorial_crouching: Area2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_Crouching"
@onready var tutorial_crouching_collision: CollisionShape2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_Crouching/CollisionShape2D"
@onready var cutscene_tutorial_enemy_and_slam_dash: Area2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_EnemyAndSlamDash"
@onready var tutorial_enemy_collision: CollisionShape2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_EnemyAndSlamDash/CollisionShape2D"
@onready var cutscene_tutorial_other_collectables: Area2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_OtherCollectables"
@onready var tutorial_collectable_collision: CollisionShape2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_OtherCollectables/CollisionShape2D"
@onready var cutscene_tutorial_checkpoints: Area2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_Checkpoints"
@onready var tutorial_checkpoint_collision: CollisionShape2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_Checkpoints/CollisionShape2D"
@onready var cutscene_tutorial_other_mechanics: Area2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_OtherMechanics"
@onready var tutorial_others_collision: CollisionShape2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_OtherMechanics/CollisionShape2D"
@onready var cutscene_tutorial_end_star_outro: Area2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_EndStar_Outro"
@onready var tutorial_ending_collision: CollisionShape2D = $"../SceneObjects/CutsceneTrigger/Cutscene_Tutorial_EndStar_Outro/CollisionShape2D"

@onready var collectable_icons: AnimatedSprite2D = $"../tutorial_sign_collectable/CollectableIcons"

var play_cutscene_doublejump = false
var play_cutscene_triangles = false
var play_cutscene_crouch = false
var play_cutscene_enemy = false
var play_cutscene_collectable = false
var play_cutscene_checkpoint = false
var play_cutscene_others = false
var play_cutscene_ending = false

var sign_show_square = false
var sign_show_health = false
var sign_show_healthbar = false
var sign_show_healthbar_empty = false
var sign_show_lives = false
var sign_show_1up = false
var sign_show_none = true

var got_triangle1 = false
var got_triangle2 = false
var got_triangle3 = false
var got_triangle4 = false

var startouched = false

#UI Things
var points = 0
var pointst = 0
var pointsh = 0

var lives = SaveFileManager.currentplayerlives
var livest = SaveFileManager.currentplayerlivest
var livesmax = SaveFileManager.maxcurrentlives

var lost_life = false

var secretfound = 0

var health = 5
var boss_health = 8
var boss_defeat = false

func _ready():
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod = load(player_character_mod_path).instantiate()
	else:
		ShimejiCharacter_Playable = load(player_character_path).instantiate()
	
	if ModeManager.in_gameplay:
		if ModeManager.is_story:
			if ModeManager.isin_worldmap:
				DiscordRPC.details = "World Map in: " + LevelsManager.worldname + ""
			else:
				DiscordRPC.details = "Story Mode in: " + LevelsManager.leveldisplay + ""
			DiscordRPC.state = "Playing as: " + CharactersManager.characterdisplay + ""
			DiscordRPC.refresh()
		else:
			DiscordRPC.details = "Playing a level: " + LevelsManager.leveldisplay + ""
			DiscordRPC.state = "Playing as: " + CharactersManager.characterdisplay + ""
			DiscordRPC.refresh()
	
	
	if is_ingame:
		return
	else:
		var scene = get_node("../SceneObjects")
		if CharactersManager.is_mod:
			ShimejiCharacter_PlayableMod.position = character_spawn.global_position
			scene.remove_child(shimeji_character_playable)
			scene.add_child(ShimejiCharacter_PlayableMod)
			ShimejiCharacter_PlayableMod.name = shimeji_character_playable.name
			char_name.text = ShimejiCharacter_PlayableMod.charname
			char_name_dark.text = ShimejiCharacter_PlayableMod.charname
			texture_rect.modulate = Color(ShimejiCharacter_PlayableMod.charcolour)
			score_layout_bg_2.modulate = Color(ShimejiCharacter_PlayableMod.charcolour)
			score_char_health.modulate = Color(ShimejiCharacter_PlayableMod.charcolour)
			score_char_portrait.texture = ShimejiCharacter_PlayableMod.score_charPortrait
			score_char_life.texture = ShimejiCharacter_PlayableMod.charIcon
			if ShimejiCharacter_PlayableMod.darkcolour or ShimejiCharacter_PlayableMod.charcolour == "#000000":
				char_name.set("theme_override_colors/font_color", Color("#ffffff"))
				score_numbers_h.hide()
				score_numbers_t.hide()
				score_numbers_u.hide()
				score_ex.hide()
				score_numbers_dark_h.show()
				score_numbers_dark_t.show()
				score_numbers_dark_u.show()
				score_ex_dark.show()
				score_numbers_life_t.hide()
				score_numbers_life_u.hide()
				score_ex_life.hide()
				score_ex_life_dark.show()
				score_numbers_life_dark_t.show()
				score_numbers_life_dark_u.show()
			
			if ShimejiCharacter_PlayableMod.charcolour == "#000000":
				score_char_health.hide()
				score_char_health_dark.show()
				texture_rect.hide()
				score_layout_bg_2.hide()
				texture_rect_dark.show()
				score_layout_bg_dark.show()
		else:
			ShimejiCharacter_Playable.position = character_spawn.global_position
			scene.remove_child(shimeji_character_playable)
			scene.add_child(ShimejiCharacter_Playable)
			ShimejiCharacter_Playable.name = shimeji_character_playable.name
			char_name.text = ShimejiCharacter_Playable.charname
			char_name_dark.text = ShimejiCharacter_Playable.charname
			texture_rect.modulate = Color(ShimejiCharacter_Playable.charcolour)
			score_layout_bg_2.modulate = Color(ShimejiCharacter_Playable.charcolour)
			score_char_health.modulate = Color(ShimejiCharacter_Playable.charcolour)
			score_char_portrait.texture = ShimejiCharacter_Playable.score_charPortrait
			score_char_life.texture = ShimejiCharacter_Playable.charIcon
			if ShimejiCharacter_Playable.darkcolour or ShimejiCharacter_Playable.charcolour == "#000000":
				char_name.set("theme_override_colors/font_color", Color("#ffffff"))
				score_numbers_h.hide()
				score_numbers_t.hide()
				score_numbers_u.hide()
				score_ex.hide()
				score_numbers_dark_h.show()
				score_numbers_dark_t.show()
				score_numbers_dark_u.show()
				score_ex_dark.show()
				score_numbers_life_t.hide()
				score_numbers_life_u.hide()
				score_ex_life.hide()
				score_ex_life_dark.show()
				score_numbers_life_dark_t.show()
				score_numbers_life_dark_u.show()
			
			if ShimejiCharacter_Playable.charcolour == "#000000":
				score_char_health.hide()
				score_char_health_dark.show()
				texture_rect.hide()
				score_layout_bg_2.hide()
				texture_rect_dark.show()
				score_layout_bg_dark.show()

	if ModeManager.is_story:
		if SaveFileManager.currentplayerlives == 1 or SaveFileManager.currentplayerlives == 2 or SaveFileManager.currentplayerlives == 3 or SaveFileManager.currentplayerlives == 4 or SaveFileManager.currentplayerlives == 5 or SaveFileManager.currentplayerlives == 6 or SaveFileManager.currentplayerlives == 7 or SaveFileManager.currentplayerlives == 8 or SaveFileManager.currentplayerlives == 9:
			score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
			score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
		if SaveFileManager.currentplayerlives == 10 or SaveFileManager.currentplayerlives == 20 or SaveFileManager.currentplayerlives == 30 or SaveFileManager.currentplayerlives == 40 or SaveFileManager.currentplayerlives == 50 or SaveFileManager.currentplayerlives == 60 or SaveFileManager.currentplayerlives == 70 or SaveFileManager.currentplayerlives == 80 or SaveFileManager.currentplayerlives == 90:
			score_numbers_life_t.animation = str(SaveFileManager.currentplayerlivest)
			score_numbers_life_dark_t.animation = str(SaveFileManager.currentplayerlivest)
			score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
			score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
	else:
		lives = LivesManager.currentlives
		livest = LivesManager.currentlivest
		livesmax = LivesManager.maxcurrentlives

#Used purposely for Tutorial
func _process(_delta: float) -> void:
	#So the game won't crashed when loading to any other level.
	if LevelsManager.levelname == "tutorial":
		if ModeManager.isin_worldmap:
			pass
		else:
			if sign_show_square:
				collectable_icons.animation = "square"
			elif sign_show_health:
				collectable_icons.animation = "health"
			elif sign_show_healthbar:
				collectable_icons.animation = "healthbar_full"
			elif sign_show_healthbar_empty:
				collectable_icons.animation = "healthbar_empty"
			elif sign_show_1up:
				collectable_icons.animation = "1up"
			elif sign_show_lives:
				collectable_icons.animation = "lives"
			elif sign_show_none:
				collectable_icons.animation = "empty"

func respawn_shimeji():
	if CharactersManager.is_mod:
		if ShimejiCharacter_PlayableMod.has_respawned == false:
			if current_checkpoint != null:
				ShimejiCharacter_PlayableMod.position = current_checkpoint.global_position
			else:
				ShimejiCharacter_PlayableMod.position = character_spawn.global_position
			ShimejiCharacter_PlayableMod.has_respawned = true
			health += 5
			score_char_health.animation = str(health)
			score_char_health_dark.animation = str(health)
		else:
			return
	else:
		if ShimejiCharacter_Playable.has_respawned == false:
			if current_checkpoint != null:
				ShimejiCharacter_Playable.position = current_checkpoint.global_position
			else:
				ShimejiCharacter_Playable.position = character_spawn.global_position
			ShimejiCharacter_Playable.has_respawned = true
			health += 5
			score_char_health.animation = str(health)
			score_char_health_dark.animation = str(health)
		else:
			return

func add_point():
	points += 1
	if points == 1 or points == 2 or points == 3 or points == 4 or points == 5 or points == 6 or points == 7 or points == 8 or points == 9:
		score_numbers_u.animation = str(points)
		score_numbers_dark_u.animation = str(points)
	if points == 10 or points == 20 or points == 30 or points == 40 or points == 50 or points == 60 or points == 70 or points == 80 or points == 90:
		pointst += 1
		score_numbers_t.animation = str(pointst)
		score_numbers_dark_t.animation = str(pointst)
		points = 0
		score_numbers_u.animation = str(points)
		score_numbers_dark_u.animation = str(points)
	if pointst == 10 or pointst == 20 or pointst == 30 or pointst == 40 or pointst == 50 or pointst == 60 or pointst == 70 or pointst == 80 or pointst == 90:
		pointsh += 1
		score_numbers_h.animation = str(pointsh)
		score_numbers_dark_h.animation = str(pointsh)
		pointst = 0
		score_numbers_t.animation = str(pointst)
		score_numbers_dark_t.animation = str(pointst)
		points = 0
		score_numbers_u.animation = str(points)
		score_numbers_dark_u.animation = str(points)

func add_lives():
	if ModeManager.is_story:
		lives += 1
		livesmax += 1
		if lives == 10 or lives == 20 or lives == 30 or lives == 40 or lives == 50 or lives == 60 or lives == 70 or lives == 80 or lives == 90:
			livest += 1
			score_numbers_life_t.animation = str(livest)
			score_numbers_life_dark_t.animation = str(livest)
			lives = 0
			score_numbers_life_u.animation = str(lives)
			score_numbers_life_dark_u.animation = str(lives)
		SaveFileManager.new_life()
	else:
		lives += 1
		livesmax += 1
		if lives == 10 or lives == 20 or lives == 30 or lives == 40 or lives == 50 or lives == 60 or lives == 70 or lives == 80 or lives == 90:
			livest += 1
			score_numbers_life_t.animation = str(livest)
			score_numbers_life_dark_t.animation = str(livest)
			lives = 0
			score_numbers_life_u.animation = str(lives)
			score_numbers_life_dark_u.animation = str(lives)
	score_numbers_life_u.animation = str(lives)
	score_numbers_life_dark_u.animation = str(lives)
	print("Max Lives: " + str(livesmax))
	print("Lives: " + str(lives))
	print("Lives (Ten): " + str(livest))

func secretfounded():
	secretfound += 1
	if secretfound == 1:
		if ModeManager.is_story:
			got_triangle1 = true
		triangle_counter_1.animation = "found"
	if secretfound == 2:
		if ModeManager.is_story:
			got_triangle2 = true
		triangle_counter_2.animation = "found" 
	if secretfound == 3:
		if ModeManager.is_story:
			got_triangle3 = true
		triangle_counter_3.animation = "found" 
	if secretfound == 4:
		if ModeManager.is_story:
			got_triangle4 = true
		triangle_counter_4.animation = "found" 

func lose_health():
	health -= 1
	score_char_health.animation = str(health)
	score_char_health_dark.animation = str(health)
	if health == 0:
		lose_lives()

func lose_lives():
	if ModeManager.is_story:
		lives -= 1
		livesmax -= 1
		if livesmax == 10 or livesmax == 20 or livesmax == 30 or livesmax == 40 or livesmax == 50 or livesmax == 60 or livesmax == 70 or livesmax == 80 or livesmax == 90:
			livest -= 1
			score_numbers_life_t.animation = str(livest)
			score_numbers_life_dark_t.animation = str(livest)
			lives = 9
			score_numbers_life_u.animation = str(lives)
			score_numbers_life_dark_u.animation = str(lives)
		SaveFileManager.lose_life()
	else:
		lives -= 1
		livesmax -= 1
		if livesmax == 9 or livesmax == 19 or livesmax == 29 or livesmax == 39 or livesmax == 49 or livesmax == 59 or livesmax == 69 or livesmax == 79 or livesmax == 89:
			livest -= 1
			score_numbers_life_t.animation = str(livest)
			score_numbers_life_dark_t.animation = str(livest)
			lives = 9
			score_numbers_life_u.animation = str(lives)
			score_numbers_life_dark_u.animation = str(lives)
	score_numbers_life_u.animation = str(lives)
	score_numbers_life_dark_u.animation = str(lives)
	print("Max Lives: " + str(livesmax))
	print("Lives: " + str(lives))
	print("Lives (Ten): " + str(livest))
	
func boss_lose_health():
	boss_health -= 1
	boss_health_bar.animation = str(boss_health)

func onehit_death():
	health = 0
	score_char_health.animation = str(health)
	score_char_health_dark.animation = str(health)
	lose_lives()

func load_gameover():
	LoadManager.load_scene("res://scenes/gameover/game_over.tscn")

func cutscenemode_on():
	is_incutscene = true
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.is_incutscene = true
	else:
		ShimejiCharacter_Playable.is_incutscene = true
	
func cutscenemode_off():
	is_incutscene = false
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.is_incutscene = false
	else:
		ShimejiCharacter_Playable.is_incutscene = false
	
func add_health():
	if health == 5:
		health += 0
		score_char_health.animation = str(health)
		score_char_health_dark.animation = str(health)
		#Then it won't add any health...
	else:
		health += 1
		score_char_health.animation = str(health)
		score_char_health_dark.animation = str(health)

func get_nodes_in_scene(scene:Node) -> Array:
	var nodes = [scene]
	for child in scene.get_children():
		nodes.append_array(get_nodes_in_scene(child))
	
	return nodes

#Tutorial Cutscene stuff

func _on_cutscene_tutorial_double_jump_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		play_cutscene_doublejump = true
		tutorial_doublejump_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_triangles_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		play_cutscene_triangles = true
		tutorial_triangles_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_crouching_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		play_cutscene_crouch = true
		tutorial_crouching_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_enemy_and_slam_dash_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		play_cutscene_enemy = true
		tutorial_enemy_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_other_collectables_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		play_cutscene_collectable = true
		tutorial_collectable_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_checkpoints_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		play_cutscene_checkpoint = true
		tutorial_checkpoint_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_other_mechanics_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		play_cutscene_others = true
		tutorial_others_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_end_star_outro_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		play_cutscene_ending = true
		tutorial_ending_collision.call_deferred("queue_free") 
		
func finish_boss():
	boss_defeat = true
	level_bgm.stop()
	level_boss_clear.play()
	boss_finish_screen_anim.play("bossfinish_screen")
	
