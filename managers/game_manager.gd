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
@onready var shimeji_character_playable_player_2: CharacterBody2D = $"../SceneObjects/ShimejiCharacter_Playable_Player2"
@onready var shimeji_character_playable_player_3: CharacterBody2D = $"../SceneObjects/ShimejiCharacter_Playable_Player3"
@onready var shimeji_character_playable_player_4: CharacterBody2D = $"../SceneObjects/ShimejiCharacter_Playable_Player4"


@onready var scene_objects: Node = $"../SceneObjects"
@onready var boss_health_bar: AnimatedSprite2D = $"../UI/GUI/BossUIBase/BossHealth/Boss_HealthBar"


#Secret Triangles (for Story Mode)
@onready var secret_triangle: Area2D = $"../SceneObjects/SecretTriangles/SecretTriangle"
@onready var secret_triangle_2: Area2D = $"../SceneObjects/SecretTriangles/SecretTriangle2"
@onready var secret_triangle_3: Area2D = $"../SceneObjects/SecretTriangles/SecretTriangle3"
@onready var secret_triangle_4: Area2D = $"../SceneObjects/SecretTriangles/SecretTriangle4"
var triangle_already_path1 = "res://scenes/collectable/secret_triangle_collected.tscn"
var triangle_already_path2 = "res://scenes/collectable/secret_triangle_collected.tscn"
var triangle_already_path3 = "res://scenes/collectable/secret_triangle_collected.tscn"
var triangle_already_path4 = "res://scenes/collectable/secret_triangle_collected.tscn"
@onready var AC_Triangle1 : Area2D
@onready var AC_Triangle2 : Area2D
@onready var AC_Triangle3 : Area2D
@onready var AC_Triangle4 : Area2D

var ac_trianglespawn1 = false
var ac_trianglespawn2 = false
var ac_trianglespawn3 = false
var ac_trianglespawn4 = false

@onready var pause: Node = $"../UI/Pause"
@onready var results: Node = %Results


#Checkpoint Thing
var current_checkpoint : Checkpoint
var current_checkpoint_p2 : Checkpoint
var current_checkpoint_p3 : Checkpoint
var current_checkpoint_p4 : Checkpoint
var player : CharacterBody2D

#Multiplayer
@onready var multiplayer_cam: Camera2D = $"../MultiplayerCam"

#Character UI Thing
@onready var char_name: Label = $"../UI/GUI/CharUIBase/LayoutNameBG/CharName"
@onready var texture_rect: TextureRect = $"../UI/GUI/CharUIBase/LayoutNameBG/TextureRect"
@onready var score_layout_bg_2: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/Score_LayoutBG2"
@onready var score_char_portrait: TextureRect = $"../UI/GUI/CharUIBase/CharPanel/Score_CharPortrait"
@onready var score_char_life: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/Score_CharLife"
@onready var score_ex: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/Ex/Score_Ex"
@onready var score_ex_life: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/CharLife/ExLife/Score_ExLife"
@onready var player_position: AnimatedSprite2D = $"../UI/GUI/CharUIBase/PlayerPosition"

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

#UI Thing (Player 2)
@onready var char_ui_base_player_2: Panel = $"../UI/GUI/CharUIBasePlayer2"
@onready var score_char_portrait_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/CharPanel/Score_CharPortrait"
@onready var texture_rect_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutNameBG/TextureRect"
@onready var texture_rect_dark_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutNameBG/TextureRectDark"
@onready var char_name_p2: Label = $"../UI/GUI/CharUIBasePlayer2/LayoutNameBG/CharName"
@onready var char_name_dark_p2: Label = $"../UI/GUI/CharUIBasePlayer2/LayoutNameBG/CharNameDark"
@onready var score_layout_bg_2_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Score_LayoutBG2"
@onready var score_layout_bg_dark_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Score_LayoutBGDark"
@onready var score_ex_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Ex/Score_Ex"
@onready var score_ex_dark_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Ex/Score_ExDark"
@onready var score_numbers_h_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Numbers/Score_NumbersH"
@onready var score_numbers_dark_h_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Numbers/Score_NumbersDarkH"
@onready var score_numbers_t_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Numbers/Score_NumbersT"
@onready var score_numbers_dark_t_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Numbers/Score_NumbersDarkT"
@onready var score_numbers_u_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Numbers/Score_NumbersU"
@onready var score_numbers_dark_u_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Numbers/Score_NumbersDarkU"
@onready var score_char_life_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/CharLife/Score_CharLife"
@onready var score_ex_life_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/CharLife/ExLife/Score_ExLife"
@onready var score_ex_life_dark_p2: TextureRect = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/CharLife/ExLife/Score_ExLifeDark"
@onready var score_numbers_life_t_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeT"
@onready var score_numbers_life_dark_t_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkT"
@onready var score_numbers_life_u_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeU"
@onready var score_numbers_life_dark_u_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkU"
@onready var score_char_health_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Health/Score_CharHealth"
@onready var score_char_health_dark_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/LayoutMain/Health/Score_CharHealthDark"
@onready var player_position_p2: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer2/PlayerPosition"

#UI Thing (Player 3)
@onready var char_ui_base_player_3: Panel = $"../UI/GUI/CharUIBasePlayer3"
@onready var score_char_portrait_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/CharPanel/Score_CharPortrait"
@onready var texture_rect_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutNameBG/TextureRect"
@onready var texture_rect_dark_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutNameBG/TextureRectDark"
@onready var char_name_p3: Label = $"../UI/GUI/CharUIBasePlayer3/LayoutNameBG/CharName"
@onready var char_name_dark_p3: Label = $"../UI/GUI/CharUIBasePlayer3/LayoutNameBG/CharNameDark"
@onready var score_layout_bg_2_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Score_LayoutBG2"
@onready var score_layout_bg_dark_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Score_LayoutBGDark"
@onready var score_ex_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Ex/Score_Ex"
@onready var score_ex_dark_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Ex/Score_ExDark"
@onready var score_numbers_h_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Numbers/Score_NumbersH"
@onready var score_numbers_dark_h_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Numbers/Score_NumbersDarkH"
@onready var score_numbers_t_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Numbers/Score_NumbersT"
@onready var score_numbers_dark_t_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Numbers/Score_NumbersDarkT"
@onready var score_numbers_u_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Numbers/Score_NumbersU"
@onready var score_numbers_dark_u_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Numbers/Score_NumbersDarkU"
@onready var score_char_life_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/CharLife/Score_CharLife"
@onready var score_ex_life_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/CharLife/ExLife/Score_ExLife"
@onready var score_ex_life_dark_p3: TextureRect = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/CharLife/ExLife/Score_ExLifeDark"
@onready var score_numbers_life_t_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeT"
@onready var score_numbers_life_dark_t_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkT"
@onready var score_numbers_life_u_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeU"
@onready var score_numbers_life_dark_u_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkU"
@onready var score_char_health_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Health/Score_CharHealth"
@onready var score_char_health_dark_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/LayoutMain/Health/Score_CharHealthDark"
@onready var player_position_p3: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer3/PlayerPosition"

#UI Thing (Player 4)
@onready var char_ui_base_player_4: Panel = $"../UI/GUI/CharUIBasePlayer4"
@onready var score_char_portrait_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/CharPanel/Score_CharPortrait"
@onready var texture_rect_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutNameBG/TextureRect"
@onready var texture_rect_dark_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutNameBG/TextureRectDark"
@onready var char_name_p4: Label = $"../UI/GUI/CharUIBasePlayer4/LayoutNameBG/CharName"
@onready var char_name_dark_p4: Label = $"../UI/GUI/CharUIBasePlayer4/LayoutNameBG/CharNameDark"
@onready var score_layout_bg_2_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Score_LayoutBG2"
@onready var score_layout_bg_dark_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Score_LayoutBGDark"
@onready var score_ex_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Ex/Score_Ex"
@onready var score_ex_dark_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Ex/Score_ExDark"
@onready var score_numbers_h_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Numbers/Score_NumbersH"
@onready var score_numbers_dark_h_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Numbers/Score_NumbersDarkH"
@onready var score_numbers_t_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Numbers/Score_NumbersT"
@onready var score_numbers_dark_t_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Numbers/Score_NumbersDarkT"
@onready var score_numbers_u_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Numbers/Score_NumbersU"
@onready var score_numbers_dark_u_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Numbers/Score_NumbersDarkU"
@onready var score_char_life_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/CharLife/Score_CharLife"
@onready var score_ex_life_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/CharLife/ExLife/Score_ExLife"
@onready var score_ex_life_dark_p4: TextureRect = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/CharLife/ExLife/Score_ExLifeDark"
@onready var score_numbers_life_t_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeT"
@onready var score_numbers_life_dark_t_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkT"
@onready var score_numbers_life_u_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeU"
@onready var score_numbers_life_dark_u_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkU"
@onready var score_char_health_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Health/Score_CharHealth"
@onready var score_char_health_dark_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/LayoutMain/Health/Score_CharHealthDark"
@onready var player_position_p4: AnimatedSprite2D = $"../UI/GUI/CharUIBasePlayer4/PlayerPosition"

#Multiple Playable Character thing.
var player_character_path = "res://scenes/characters/playable/" + CharactersManager.charactername + "/shimeji_character_playable.tscn"
var player_character_mod_path = "res://mods/characters/" + CharactersManager.charactername + "/scene/shimeji_character_playable.tscn"
var player_character_path_p2 = "res://scenes/characters/playable/" + CharactersManager.charactername_player2 + "/shimeji_character_playable.tscn"
var player_character_mod_path_p2 = "res://mods/characters/" + CharactersManager.charactername_player2 + "/scene/shimeji_character_playable.tscn"
var player_character_path_p3 = "res://scenes/characters/playable/" + CharactersManager.charactername_player3 + "/shimeji_character_playable.tscn"
var player_character_mod_path_p3 = "res://mods/characters/" + CharactersManager.charactername_player3 + "/scene/shimeji_character_playable.tscn"
var player_character_path_p4 = "res://scenes/characters/playable/" + CharactersManager.charactername_player4 + "/shimeji_character_playable.tscn"
var player_character_mod_path_p4 = "res://mods/characters/" + CharactersManager.charactername_player4 + "/scene/shimeji_character_playable.tscn"
@onready var ShimejiCharacter_Playable : CharacterBody2D
@onready var ShimejiCharacter_PlayableMod : CharacterBody2D
@onready var ShimejiCharacter_Playable_p2 : CharacterBody2D
@onready var ShimejiCharacter_PlayableMod_p2 : CharacterBody2D
@onready var ShimejiCharacter_Playable_p3 : CharacterBody2D
@onready var ShimejiCharacter_PlayableMod_p3 : CharacterBody2D
@onready var ShimejiCharacter_Playable_p4 : CharacterBody2D
@onready var ShimejiCharacter_PlayableMod_p4 : CharacterBody2D
@onready var MultiplayerCam : Camera2D
@onready var character_spawn: Node2D = $"../CharacterSpawn"
@onready var character_spawn_player_2: Node2D = $"../CharacterSpawn_Player2"
@onready var character_spawn_player_3: Node2D = $"../CharacterSpawn_Player3"
@onready var character_spawn_player_4: Node2D = $"../CharacterSpawn_Player4"
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

var lives = 3
var livest = 0
var livesmax = 3

var lost_life = false

var secretfound = 0

var health = 5
var boss_health = 8
var boss_defeat = false

#UI Things (Player 2)
var points_p2 = 0
var pointst_p2 = 0
var pointsh_p2 = 0

var lives_p2 = 3
var livest_p2 = 0
var livesmax_p2 = 3

var lost_life_p2 = false

var health_p2 = 5

#UI Things (Player 3)
var points_p3 = 0
var pointst_p3 = 0
var pointsh_p3 = 0

var lives_p3 = 3
var livest_p3 = 0
var livesmax_p3 = 3

var lost_life_p3 = false

var health_p3 = 5

#UI Things (Player 4)
var points_p4 = 0
var pointst_p4 = 0
var pointsh_p4 = 0

var lives_p4 = 3
var livest_p4 = 0
var livesmax_p4 = 3

var lost_life_p4 = false

var health_p4 = 5

func _ready():
	if ModeManager.is_story && ModeManager.is_savefile1:
		lives = SaveFileManager.currentplayerlives
		livest = SaveFileManager.currentplayerlivest
		livesmax = SaveFileManager.maxcurrentlives
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_p2 = load(player_character_mod_path_p2).instantiate()
			else:
				ShimejiCharacter_Playable_p2 = load(player_character_path_p2).instantiate()
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_p3 = load(player_character_mod_path_p3).instantiate()
			else:
				ShimejiCharacter_Playable_p3 = load(player_character_path_p3).instantiate()
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_p4 = load(player_character_mod_path_p4).instantiate()
			else:
				ShimejiCharacter_Playable_p4 = load(player_character_path_p4).instantiate()
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod = load(player_character_mod_path).instantiate()
	else:
		ShimejiCharacter_Playable = load(player_character_path).instantiate()
	
	MultiplayerCam = load("res://scenes/gameplaymechanics/multiplayer/multiplayer_cam.tscn").instantiate()
	
	if ModeManager.in_gameplay:
		if ModeManager.is_story:
			if ModeManager.isin_worldmap:
				DiscordRPC.details = "World Map in: " + LevelsManager.worldname + ""
			else:
				DiscordRPC.details = "Story Mode in: " + LevelsManager.leveldisplay + ""
			if ModeManager.is_multiplayer:
				if ModeManager.multi_2players:
					DiscordRPC.state = "Multiplayer: [2/4]"
				if ModeManager.multi_3players:
					DiscordRPC.state = "Multiplayer: [3/4]"
				if ModeManager.multi_4players:
					DiscordRPC.state = "Multiplayer: [4/4]"
			else:
				DiscordRPC.state = "Playing as: " + CharactersManager.characterdisplay + ""
			DiscordRPC.refresh()
		else:
			DiscordRPC.details = "Playing a level: " + LevelsManager.leveldisplay + ""
			if ModeManager.is_multiplayer:
				if ModeManager.multi_2players:
					DiscordRPC.state = "Multiplayer: [2/4]"
				if ModeManager.multi_3players:
					DiscordRPC.state = "Multiplayer: [3/4]"
				if ModeManager.multi_4players:
					DiscordRPC.state = "Multiplayer: [4/4]"
			else:
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
			ShimejiCharacter_PlayableMod.is_player1 = true
			ShimejiCharacter_PlayableMod.name = shimeji_character_playable.name
			if ShimejiCharacter_PlayableMod.multilingual:
				match LanguageManager.language:
					"spanish":
						char_name.text = ShimejiCharacter_PlayableMod.charname_spa
						char_name_dark.text = ShimejiCharacter_PlayableMod.charname_spa
					"french":
						char_name.text = ShimejiCharacter_PlayableMod.charname_fre
						char_name_dark.text = ShimejiCharacter_PlayableMod.charname_fre
					"italian":
						char_name.text = ShimejiCharacter_PlayableMod.charname_ita
						char_name_dark.text = ShimejiCharacter_PlayableMod.charname_ita
					"german":
						char_name.text = ShimejiCharacter_PlayableMod.charname_ger
						char_name_dark.text = ShimejiCharacter_PlayableMod.charname_ger
					"japanese":
						char_name.text = ShimejiCharacter_PlayableMod.charname_jpn
						char_name_dark.text = ShimejiCharacter_PlayableMod.charname_jpn
					_:
						char_name.text = ShimejiCharacter_PlayableMod.charname
						char_name_dark.text = ShimejiCharacter_PlayableMod.charname
			else:
				char_name.text = ShimejiCharacter_PlayableMod.charname
				char_name_dark.text = ShimejiCharacter_PlayableMod.charname
			texture_rect.modulate = Color(ShimejiCharacter_PlayableMod.charcolour)
			score_layout_bg_2.modulate = Color(ShimejiCharacter_PlayableMod.charcolour)
			score_char_health.modulate = Color(ShimejiCharacter_PlayableMod.charcolour)
			score_char_portrait.texture = ShimejiCharacter_PlayableMod.score_charPortrait
			score_char_life.texture = ShimejiCharacter_PlayableMod.charIcon
			player_position.modulate = Color(ShimejiCharacter_PlayableMod.charcolour)
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
				player_position.modulate = Color("#ffffff")
		else:
			ShimejiCharacter_Playable.position = character_spawn.global_position
			scene.remove_child(shimeji_character_playable)
			scene.add_child(ShimejiCharacter_Playable)
			ShimejiCharacter_Playable.is_player1 = true
			ShimejiCharacter_Playable.name = shimeji_character_playable.name
			if LanguageManager.language == "japanese":
				char_name.text = ShimejiCharacter_Playable.charname_jpn
				char_name_dark.text = ShimejiCharacter_Playable.charname_jpn
			else:
				char_name.text = ShimejiCharacter_Playable.charname
				char_name_dark.text = ShimejiCharacter_Playable.charname
			texture_rect.modulate = Color(ShimejiCharacter_Playable.charcolour)
			score_layout_bg_2.modulate = Color(ShimejiCharacter_Playable.charcolour)
			score_char_health.modulate = Color(ShimejiCharacter_Playable.charcolour)
			score_char_portrait.texture = ShimejiCharacter_Playable.score_charPortrait
			score_char_life.texture = ShimejiCharacter_Playable.charIcon
			player_position.modulate = Color(ShimejiCharacter_Playable.charcolour)
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
				player_position.modulate = Color("#ffffff")
				
		if ModeManager.is_multiplayer:
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p2:
					ShimejiCharacter_PlayableMod_p2.position = character_spawn_player_2.global_position
					scene.remove_child(shimeji_character_playable_player_2)
					scene.add_child(ShimejiCharacter_PlayableMod_p2)
					ShimejiCharacter_PlayableMod_p2.is_player2 = true
					ShimejiCharacter_PlayableMod_p2.name = shimeji_character_playable_player_2.name
					if ShimejiCharacter_PlayableMod_p2.multilingual:
						match LanguageManager.language:
							"spanish":
								char_name_p2.text = ShimejiCharacter_PlayableMod_p2.charname_spa
								char_name_dark_p2.text = ShimejiCharacter_PlayableMod_p2.charname_spa
							"french":
								char_name_p2.text = ShimejiCharacter_PlayableMod_p2.charname_fre
								char_name_dark_p2.text = ShimejiCharacter_PlayableMod_p2.charname_fre
							"italian":
								char_name_p2.text = ShimejiCharacter_PlayableMod_p2.charname_ita
								char_name_dark_p2.text = ShimejiCharacter_PlayableMod_p2.charname_ita
							"german":
								char_name_p2.text = ShimejiCharacter_PlayableMod_p2.charname_ger
								char_name_dark_p2.text = ShimejiCharacter_PlayableMod_p2.charname_ger
							"japanese":
								char_name_p2.text = ShimejiCharacter_PlayableMod_p2.charname_jpn
								char_name_dark_p2.text = ShimejiCharacter_PlayableMod_p2.charname_jpn
							_:
								char_name_p2.text = ShimejiCharacter_PlayableMod_p2.charname
								char_name_dark_p2.text = ShimejiCharacter_PlayableMod_p2.charname
					else:
						char_name_p2.text = ShimejiCharacter_PlayableMod_p2.charname
						char_name_dark_p2.text = ShimejiCharacter_PlayableMod_p2.charname
					texture_rect_p2.modulate = Color(ShimejiCharacter_PlayableMod_p2.charcolour)
					score_layout_bg_2_p2.modulate = Color(ShimejiCharacter_PlayableMod_p2.charcolour)
					score_char_health_p2.modulate = Color(ShimejiCharacter_PlayableMod_p2.charcolour)
					score_char_portrait_p2.texture = ShimejiCharacter_PlayableMod_p2.score_charPortrait
					score_char_life_p2.texture = ShimejiCharacter_PlayableMod_p2.charIcon
					player_position_p2.modulate = Color(ShimejiCharacter_PlayableMod_p2.charcolour)
					if ShimejiCharacter_PlayableMod_p2.darkcolour or ShimejiCharacter_PlayableMod_p2.charcolour == "#000000":
						char_name_p2.set("theme_override_colors/font_color", Color("#ffffff"))
						score_numbers_h_p2.hide()
						score_numbers_t_p2.hide()
						score_numbers_u_p2.hide()
						score_ex_p2.hide()
						score_numbers_dark_h_p2.show()
						score_numbers_dark_t_p2.show()
						score_numbers_dark_u_p2.show()
						score_ex_dark_p2.show()
						score_numbers_life_t_p2.hide()
						score_numbers_life_u_p2.hide()
						score_ex_life_p2.hide()
						score_ex_life_dark_p2.show()
						score_numbers_life_dark_t_p2.show()
						score_numbers_life_dark_u_p2.show()
					
					if ShimejiCharacter_PlayableMod_p2.charcolour == "#000000":
						score_char_health_p2.hide()
						score_char_health_dark_p2.show()
						texture_rect_p2.hide()
						score_layout_bg_2_p2.hide()
						texture_rect_dark_p2.show()
						score_layout_bg_dark_p2.show()
						player_position_p2.modulate = Color("#ffffff")
						player_position_p2.animation = "player2_dark"
				else:
					ShimejiCharacter_Playable_p2.position = character_spawn_player_2.global_position
					scene.remove_child(shimeji_character_playable_player_2)
					scene.add_child(ShimejiCharacter_Playable_p2)
					ShimejiCharacter_Playable_p2.is_player2 = true
					ShimejiCharacter_Playable_p2.name = shimeji_character_playable_player_2.name
					if LanguageManager.language == "japanese":
						char_name_p2.text = ShimejiCharacter_Playable_p2.charname_jpn
						char_name_dark_p2.text = ShimejiCharacter_Playable_p2.charname_jpn
					else:
						char_name_p2.text = ShimejiCharacter_Playable_p2.charname
						char_name_dark_p2.text = ShimejiCharacter_Playable_p2.charname
					texture_rect_p2.modulate = Color(ShimejiCharacter_Playable_p2.charcolour)
					score_layout_bg_2_p2.modulate = Color(ShimejiCharacter_Playable_p2.charcolour)
					score_char_health_p2.modulate = Color(ShimejiCharacter_Playable_p2.charcolour)
					score_char_portrait_p2.texture = ShimejiCharacter_Playable_p2.score_charPortrait
					score_char_life_p2.texture = ShimejiCharacter_Playable_p2.charIcon
					player_position_p2.modulate = Color(ShimejiCharacter_Playable_p2.charcolour)
					if ShimejiCharacter_Playable_p2.darkcolour or ShimejiCharacter_Playable_p2.charcolour == "#000000":
						char_name_p2.set("theme_override_colors/font_color", Color("#ffffff"))
						score_numbers_h_p2.hide()
						score_numbers_t_p2.hide()
						score_numbers_u_p2.hide()
						score_ex_p2.hide()
						score_numbers_dark_h_p2.show()
						score_numbers_dark_t_p2.show()
						score_numbers_dark_u_p2.show()
						score_ex_dark_p2.show()
						score_numbers_life_t_p2.hide()
						score_numbers_life_u_p2.hide()
						score_ex_life_p2.hide()
						score_ex_life_dark_p2.show()
						score_numbers_life_dark_t_p2.show()
						score_numbers_life_dark_u_p2.show()
					
					if ShimejiCharacter_Playable_p2.charcolour == "#000000":
						score_char_health_p2.hide()
						score_char_health_dark_p2.show()
						texture_rect_p2.hide()
						score_layout_bg_2_p2.hide()
						texture_rect_dark_p2.show()
						score_layout_bg_dark_p2.show()
						player_position_p2.modulate = Color("#ffffff")
						player_position_p2.animation = "player2_dark"
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					ShimejiCharacter_PlayableMod_p3.position = character_spawn_player_3.global_position
					scene.remove_child(shimeji_character_playable_player_3)
					scene.add_child(ShimejiCharacter_PlayableMod_p3)
					ShimejiCharacter_PlayableMod_p3.is_player3 = true
					ShimejiCharacter_PlayableMod_p3.name = shimeji_character_playable_player_3.name
					if ShimejiCharacter_PlayableMod_p3.multilingual:
						match LanguageManager.language:
							"spanish":
								char_name_p3.text = ShimejiCharacter_PlayableMod_p3.charname_spa
								char_name_dark_p3.text = ShimejiCharacter_PlayableMod_p3.charname_spa
							"french":
								char_name_p3.text = ShimejiCharacter_PlayableMod_p3.charname_fre
								char_name_dark_p3.text = ShimejiCharacter_PlayableMod_p3.charname_fre
							"italian":
								char_name_p3.text = ShimejiCharacter_PlayableMod_p3.charname_ita
								char_name_dark_p3.text = ShimejiCharacter_PlayableMod_p3.charname_ita
							"german":
								char_name_p3.text = ShimejiCharacter_PlayableMod_p3.charname_ger
								char_name_dark_p3.text = ShimejiCharacter_PlayableMod_p3.charname_ger
							"japanese":
								char_name_p3.text = ShimejiCharacter_PlayableMod_p3.charname_jpn
								char_name_dark_p3.text = ShimejiCharacter_PlayableMod_p3.charname_jpn
							_:
								char_name_p3.text = ShimejiCharacter_PlayableMod_p3.charname
								char_name_dark_p3.text = ShimejiCharacter_PlayableMod_p3.charname
					else:
						char_name_p3.text = ShimejiCharacter_PlayableMod_p3.charname
						char_name_dark_p3.text = ShimejiCharacter_PlayableMod_p3.charname
					texture_rect_p3.modulate = Color(ShimejiCharacter_PlayableMod_p3.charcolour)
					score_layout_bg_2_p3.modulate = Color(ShimejiCharacter_PlayableMod_p3.charcolour)
					score_char_health_p3.modulate = Color(ShimejiCharacter_PlayableMod_p3.charcolour)
					score_char_portrait_p3.texture = ShimejiCharacter_PlayableMod_p3.score_charPortrait
					score_char_life_p3.texture = ShimejiCharacter_PlayableMod_p3.charIcon
					player_position_p3.modulate = Color(ShimejiCharacter_PlayableMod_p3.charcolour)
					if ShimejiCharacter_PlayableMod_p3.darkcolour or ShimejiCharacter_PlayableMod_p3.charcolour == "#000000":
						char_name_p3.set("theme_override_colors/font_color", Color("#ffffff"))
						score_numbers_h_p3.hide()
						score_numbers_t_p3.hide()
						score_numbers_u_p3.hide()
						score_ex_p3.hide()
						score_numbers_dark_h_p3.show()
						score_numbers_dark_t_p3.show()
						score_numbers_dark_u_p3.show()
						score_ex_dark_p3.show()
						score_numbers_life_t_p3.hide()
						score_numbers_life_u_p3.hide()
						score_ex_life_p3.hide()
						score_ex_life_dark_p3.show()
						score_numbers_life_dark_t_p3.show()
						score_numbers_life_dark_u_p3.show()
					
					if ShimejiCharacter_PlayableMod_p3.charcolour == "#000000":
						score_char_health_p3.hide()
						score_char_health_dark_p3.show()
						texture_rect_p3.hide()
						score_layout_bg_2_p3.hide()
						texture_rect_dark_p3.show()
						score_layout_bg_dark_p3.show()
						player_position_p3.modulate = Color("#ffffff")
						player_position_p3.animation = "player3_dark"
				else:
					ShimejiCharacter_Playable_p3.position = character_spawn_player_3.global_position
					scene.remove_child(shimeji_character_playable_player_3)
					scene.add_child(ShimejiCharacter_Playable_p3)
					ShimejiCharacter_Playable_p3.is_player3 = true
					ShimejiCharacter_Playable_p3.name = shimeji_character_playable_player_3.name
					if LanguageManager.language == "japanese":
						char_name_p3.text = ShimejiCharacter_Playable_p3.charname_jpn
						char_name_dark_p3.text = ShimejiCharacter_Playable_p3.charname_jpn
					else:
						char_name_p3.text = ShimejiCharacter_Playable_p3.charname
						char_name_dark_p3.text = ShimejiCharacter_Playable_p3.charname
					texture_rect_p3.modulate = Color(ShimejiCharacter_Playable_p3.charcolour)
					score_layout_bg_2_p3.modulate = Color(ShimejiCharacter_Playable_p3.charcolour)
					score_char_health_p3.modulate = Color(ShimejiCharacter_Playable_p3.charcolour)
					score_char_portrait_p3.texture = ShimejiCharacter_Playable_p3.score_charPortrait
					score_char_life_p3.texture = ShimejiCharacter_Playable_p3.charIcon
					player_position_p3.modulate = Color(ShimejiCharacter_Playable_p3.charcolour)
					if ShimejiCharacter_Playable_p3.darkcolour or ShimejiCharacter_Playable_p3.charcolour == "#000000":
						char_name_p3.set("theme_override_colors/font_color", Color("#ffffff"))
						score_numbers_h_p3.hide()
						score_numbers_t_p3.hide()
						score_numbers_u_p3.hide()
						score_ex_p3.hide()
						score_numbers_dark_h_p3.show()
						score_numbers_dark_t_p3.show()
						score_numbers_dark_u_p3.show()
						score_ex_dark_p3.show()
						score_numbers_life_t_p3.hide()
						score_numbers_life_u_p3.hide()
						score_ex_life_p3.hide()
						score_ex_life_dark_p3.show()
						score_numbers_life_dark_t_p3.show()
						score_numbers_life_dark_u_p3.show()
					
					if ShimejiCharacter_Playable_p3.charcolour == "#000000":
						score_char_health_p3.hide()
						score_char_health_dark_p3.show()
						texture_rect_p3.hide()
						score_layout_bg_2_p3.hide()
						texture_rect_dark_p3.show()
						score_layout_bg_dark_p3.show()
						player_position_p3.modulate = Color("#ffffff")
						player_position_p3.animation = "player3_dark"
			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					ShimejiCharacter_PlayableMod_p4.position = character_spawn_player_4.global_position
					scene.remove_child(shimeji_character_playable_player_4)
					scene.add_child(ShimejiCharacter_PlayableMod_p4)
					ShimejiCharacter_PlayableMod_p4.is_player4 = true
					ShimejiCharacter_PlayableMod_p4.name = shimeji_character_playable_player_4.name
					if ShimejiCharacter_PlayableMod_p4.multilingual:
						match LanguageManager.language:
							"spanish":
								char_name_p4.text = ShimejiCharacter_PlayableMod_p4.charname_spa
								char_name_dark_p4.text = ShimejiCharacter_PlayableMod_p4.charname_spa
							"french":
								char_name_p4.text = ShimejiCharacter_PlayableMod_p4.charname_fre
								char_name_dark_p4.text = ShimejiCharacter_PlayableMod_p4.charname_fre
							"italian":
								char_name_p4.text = ShimejiCharacter_PlayableMod_p4.charname_ita
								char_name_dark_p4.text = ShimejiCharacter_PlayableMod_p4.charname_ita
							"german":
								char_name_p4.text = ShimejiCharacter_PlayableMod_p4.charname_ger
								char_name_dark_p4.text = ShimejiCharacter_PlayableMod_p4.charname_ger
							"japanese":
								char_name_p4.text = ShimejiCharacter_PlayableMod_p4.charname_jpn
								char_name_dark_p4.text = ShimejiCharacter_PlayableMod_p4.charname_jpn
							_:
								char_name_p4.text = ShimejiCharacter_PlayableMod_p4.charname
								char_name_dark_p4.text = ShimejiCharacter_PlayableMod_p4.charname
					else:
						char_name_p4.text = ShimejiCharacter_PlayableMod_p4.charname
						char_name_dark_p4.text = ShimejiCharacter_PlayableMod_p4.charname
					texture_rect_p4.modulate = Color(ShimejiCharacter_PlayableMod_p4.charcolour)
					score_layout_bg_2_p4.modulate = Color(ShimejiCharacter_PlayableMod_p4.charcolour)
					score_char_health_p4.modulate = Color(ShimejiCharacter_PlayableMod_p4.charcolour)
					score_char_portrait_p4.texture = ShimejiCharacter_PlayableMod_p4.score_charPortrait
					score_char_life_p4.texture = ShimejiCharacter_PlayableMod_p4.charIcon
					player_position_p4.modulate = Color(ShimejiCharacter_PlayableMod_p4.charcolour)
					if ShimejiCharacter_PlayableMod_p4.darkcolour or ShimejiCharacter_PlayableMod_p4.charcolour == "#000000":
						char_name_p4.set("theme_override_colors/font_color", Color("#ffffff"))
						score_numbers_h_p4.hide()
						score_numbers_t_p4.hide()
						score_numbers_u_p4.hide()
						score_ex_p4.hide()
						score_numbers_dark_h_p4.show()
						score_numbers_dark_t_p4.show()
						score_numbers_dark_u_p4.show()
						score_ex_dark_p4.show()
						score_numbers_life_t_p4.hide()
						score_numbers_life_u_p4.hide()
						score_ex_life_p4.hide()
						score_ex_life_dark_p4.show()
						score_numbers_life_dark_t_p4.show()
						score_numbers_life_dark_u_p4.show()
					
					if ShimejiCharacter_PlayableMod_p4.charcolour == "#000000":
						score_char_health_p4.hide()
						score_char_health_dark_p4.show()
						texture_rect_p4.hide()
						score_layout_bg_2_p4.hide()
						texture_rect_dark_p4.show()
						score_layout_bg_dark_p4.show()
						player_position_p4.modulate = Color("#ffffff")
						player_position_p4.animation = "player4_dark"
				else:
					ShimejiCharacter_Playable_p4.position = character_spawn_player_4.global_position
					scene.remove_child(shimeji_character_playable_player_4)
					scene.add_child(ShimejiCharacter_Playable_p4)
					ShimejiCharacter_Playable_p4.is_player4 = true
					ShimejiCharacter_Playable_p4.name = shimeji_character_playable_player_4.name
					if LanguageManager.language == "japanese":
						char_name_p4.text = ShimejiCharacter_Playable_p4.charname_jpn
						char_name_dark_p4.text = ShimejiCharacter_Playable_p4.charname_jpn
					else:
						char_name_p4.text = ShimejiCharacter_Playable_p4.charname
						char_name_dark_p4.text = ShimejiCharacter_Playable_p4.charname
					texture_rect_p4.modulate = Color(ShimejiCharacter_Playable_p4.charcolour)
					score_layout_bg_2_p4.modulate = Color(ShimejiCharacter_Playable_p4.charcolour)
					score_char_health_p4.modulate = Color(ShimejiCharacter_Playable_p4.charcolour)
					score_char_portrait_p4.texture = ShimejiCharacter_Playable_p4.score_charPortrait
					score_char_life_p4.texture = ShimejiCharacter_Playable_p4.charIcon
					player_position_p4.modulate = Color(ShimejiCharacter_Playable_p4.charcolour)
					if ShimejiCharacter_Playable_p4.darkcolour or ShimejiCharacter_Playable_p4.charcolour == "#000000":
						char_name_p4.set("theme_override_colors/font_color", Color("#ffffff"))
						score_numbers_h_p4.hide()
						score_numbers_t_p4.hide()
						score_numbers_u_p4.hide()
						score_ex_p4.hide()
						score_numbers_dark_h_p4.show()
						score_numbers_dark_t_p4.show()
						score_numbers_dark_u_p4.show()
						score_ex_dark_p4.show()
						score_numbers_life_t_p4.hide()
						score_numbers_life_u_p4.hide()
						score_ex_life_p4.hide()
						score_ex_life_dark_p4.show()
						score_numbers_life_dark_t_p4.show()
						score_numbers_life_dark_u_p4.show()
					
					if ShimejiCharacter_Playable_p4.charcolour == "#000000":
						score_char_health_p4.hide()
						score_char_health_dark_p4.show()
						texture_rect_p4.hide()
						score_layout_bg_2_p4.hide()
						texture_rect_dark_p4.show()
						score_layout_bg_dark_p4.show()
						player_position_p4.modulate = Color("#ffffff")
						player_position_p4.animation = "player4_dark"

		if ModeManager.is_multiplayer:
			if ModeManager.multi_2players:
				scene.remove_child(shimeji_character_playable_player_3)
				scene.remove_child(shimeji_character_playable_player_4)
				char_ui_base_player_3.hide()
				char_ui_base_player_4.hide()
			if ModeManager.multi_3players:
				scene.remove_child(shimeji_character_playable_player_4)
				char_ui_base_player_4.hide()
		else:
			scene.remove_child(shimeji_character_playable_player_2)
			scene.remove_child(shimeji_character_playable_player_3)
			scene.remove_child(shimeji_character_playable_player_4)
			player_position.hide()
			char_ui_base_player_2.hide()
			char_ui_base_player_3.hide()
			char_ui_base_player_4.hide()
	
	if !LevelsManager.is_bossbattle or !ModeManager.isin_worldmap:
		for p in get_tree().get_nodes_in_group("players"):
			multiplayer_cam.add_target(p)
	else:
		pass

	if ModeManager.is_story:
		if ModeManager.is_savefile1:
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
		lives_p2 = LivesManager.currentlives
		livest_p2 = LivesManager.currentlivest
		livesmax_p2 = LivesManager.maxcurrentlives
		lives_p3 = LivesManager.currentlives
		livest_p3 = LivesManager.currentlivest
		livesmax_p3 = LivesManager.maxcurrentlives
		lives_p4 = LivesManager.currentlives
		livest_p4 = LivesManager.currentlivest
		livesmax_p4 = LivesManager.maxcurrentlives
	
#Used purposely for Tutorial
func _process(_delta: float) -> void:
	if ModeManager.is_multiplayer:
		if LanguageManager.language == "spanish" || LanguageManager.language == "french":
			if CharactersManager.is_mod:
				if ShimejiCharacter_PlayableMod.charcolour == "#000000":
					player_position.play("player1_dark_spa-fre")
				else:
					player_position.play("player1_spa-fre")
			else:
				if ShimejiCharacter_Playable.charcolour == "#000000":
					player_position.play("player1_dark_spa-fre")
				else:
					player_position.play("player1_spa-fre")
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p2:
					if ShimejiCharacter_PlayableMod_p2.charcolour == "#000000":
						player_position_p2.play("player2_dark_spa-fre")
					else:
						player_position_p2.play("player2_spa-fre")
				else:
					if ShimejiCharacter_Playable_p2.charcolour == "#000000":
						player_position_p2.play("player2_dark_spa-fre")
					else:
						player_position_p2.play("player2_spa-fre")
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					if ShimejiCharacter_PlayableMod_p3.charcolour == "#000000":
						player_position_p3.play("player3_dark_spa-fre")
					else:
						player_position_p3.play("player3_spa-fre")
				else:
					if ShimejiCharacter_Playable_p3.charcolour == "#000000":
						player_position_p3.play("player3_dark_spa-fre")
					else:
						player_position_p3.play("player3_spa-fre")
			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					if ShimejiCharacter_PlayableMod_p4.charcolour == "#000000":
						player_position_p4.play("player4_dark_spa-fre")
					else:
						player_position_p4.play("player4_spa-fre")
				else:
					if ShimejiCharacter_Playable_p4.charcolour == "#000000":
						player_position_p4.play("player4_dark_spa-fre")
					else:
						player_position_p4.play("player4_spa-fre")
		else:
			if CharactersManager.is_mod:
				if ShimejiCharacter_PlayableMod.charcolour == "#000000":
					player_position.play("player1_dark_" + LanguageManager.shortlang)
				else:
					player_position.play("player1_" + LanguageManager.shortlang)
			else:
				if ShimejiCharacter_Playable.charcolour == "#000000":
					player_position.play("player1_dark_" + LanguageManager.shortlang)
				else:
					player_position.play("player1_" + LanguageManager.shortlang)
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p2:
					if ShimejiCharacter_PlayableMod_p2.charcolour == "#000000":
						player_position_p2.play("player2_dark_" + LanguageManager.shortlang)
					else:
						player_position_p2.play("player2_" + LanguageManager.shortlang)
				else:
					if ShimejiCharacter_Playable_p2.charcolour == "#000000":
						player_position_p2.play("player2_dark_" + LanguageManager.shortlang)
					else:
						player_position_p2.play("player2_" + LanguageManager.shortlang)
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					if ShimejiCharacter_PlayableMod_p3.charcolour == "#000000":
						player_position_p3.play("player3_dark_" + LanguageManager.shortlang)
					else:
						player_position_p3.play("player3_" + LanguageManager.shortlang)
				else:
					if ShimejiCharacter_Playable_p3.charcolour == "#000000":
						player_position_p3.play("player3_dark_" + LanguageManager.shortlang)
					else:
						player_position_p3.play("player3_" + LanguageManager.shortlang)
			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					if ShimejiCharacter_PlayableMod_p4.charcolour == "#000000":
						player_position_p4.play("player4_dark_" + LanguageManager.shortlang)
					else:
						player_position_p4.play("player4_" + LanguageManager.shortlang)
				else:
					if ShimejiCharacter_Playable_p4.charcolour == "#000000":
						player_position_p4.play("player4_dark_" + LanguageManager.shortlang)
					else:
						player_position_p4.play("player4_" + LanguageManager.shortlang)

	if ModeManager.is_multiplayer:
		if LanguageManager.language == "spanish" || LanguageManager.language == "french":
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod:
					if ShimejiCharacter_PlayableMod.charcolour == "#000000":
						ShimejiCharacter_PlayableMod.player_position.play("player1_dark_spa-fre")
					else:
						ShimejiCharacter_PlayableMod.player_position.play("player1_spa-fre")
				else:
					if ShimejiCharacter_Playable.charcolour == "#000000":
						ShimejiCharacter_Playable.player_position.play("player1_dark_spa-fre")
					else:
						ShimejiCharacter_Playable.player_position.play("player1_spa-fre")
				
				if CharactersManager.is_mod_p2:
					if ShimejiCharacter_PlayableMod_p2.charcolour == "#000000":
						ShimejiCharacter_PlayableMod_p2.player_position.play("player2_dark_spa-fre")
					else:
						ShimejiCharacter_PlayableMod_p2.player_position.play("player2_spa-fre")
				else:
					if ShimejiCharacter_Playable_p2.charcolour == "#000000":
						ShimejiCharacter_Playable_p2.player_position.play("player2_dark_spa-fre")
					else:
						ShimejiCharacter_Playable_p2.player_position.play("player2_spa-fre")
			
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					if ShimejiCharacter_PlayableMod_p3.charcolour == "#000000":
						ShimejiCharacter_PlayableMod_p3.player_position.play("player3_dark_spa-fre")
					else:
						ShimejiCharacter_PlayableMod_p3.player_position.play("player3_spa-fre")
				else:
					if ShimejiCharacter_Playable_p3.charcolour == "#000000":
						ShimejiCharacter_Playable_p3.player_position.play("player3_dark_spa-fre")
					else:
						ShimejiCharacter_Playable_p3.player_position.play("player3_spa-fre")

			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					if ShimejiCharacter_PlayableMod_p4.charcolour == "#000000":
						ShimejiCharacter_PlayableMod_p4.player_position.play("player4_dark_spa-fre")
					else:
						ShimejiCharacter_PlayableMod_p4.player_position.play("player4_spa-fre")
				else:
					if ShimejiCharacter_Playable_p4.charcolour == "#000000":
						ShimejiCharacter_Playable_p4.player_position.play("player4_dark_spa-fre")
					else:
						ShimejiCharacter_Playable_p4.player_position.play("player4_spa-fre")
		else:
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod:
					if ShimejiCharacter_PlayableMod.charcolour == "#000000":
						ShimejiCharacter_PlayableMod.player_position.play("player1_dark_" + LanguageManager.shortlang)
					else:
						ShimejiCharacter_PlayableMod.player_position.play("player1_" + LanguageManager.shortlang)
				else:
					if ShimejiCharacter_Playable.charcolour == "#000000":
						ShimejiCharacter_Playable.player_position.play("player1_dark_" + LanguageManager.shortlang)
					else:
						ShimejiCharacter_Playable.player_position.play("player1_" + LanguageManager.shortlang)
				
				if CharactersManager.is_mod_p2:
					if ShimejiCharacter_PlayableMod_p2.charcolour == "#000000":
						ShimejiCharacter_PlayableMod_p2.player_position.play("player2_dark_" + LanguageManager.shortlang)
					else:
						ShimejiCharacter_PlayableMod_p2.player_position.play("player2_" + LanguageManager.shortlang)
				else:
					if ShimejiCharacter_Playable_p2.charcolour == "#000000":
						ShimejiCharacter_Playable_p2.player_position.play("player2_dark_" + LanguageManager.shortlang)
					else:
						ShimejiCharacter_Playable_p2.player_position.play("player2_" + LanguageManager.shortlang)
			
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					if ShimejiCharacter_PlayableMod_p3.charcolour == "#000000":
						ShimejiCharacter_PlayableMod_p3.player_position.play("player3_dark_" + LanguageManager.shortlang)
					else:
						ShimejiCharacter_PlayableMod_p3.player_position.play("player3_" + LanguageManager.shortlang)
				else:
					if ShimejiCharacter_Playable_p3.charcolour == "#000000":
						ShimejiCharacter_Playable_p3.player_position.play("player3_dark_" + LanguageManager.shortlang)
					else:
						ShimejiCharacter_Playable_p3.player_position.play("player3_" + LanguageManager.shortlang)

			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					if ShimejiCharacter_PlayableMod_p4.charcolour == "#000000":
						ShimejiCharacter_PlayableMod_p4.player_position.play("player4_dark_" + LanguageManager.shortlang)
					else:
						ShimejiCharacter_PlayableMod_p4.player_position.play("player4_" + LanguageManager.shortlang)
				else:
					if ShimejiCharacter_Playable_p4.charcolour == "#000000":
						ShimejiCharacter_Playable_p4.player_position.play("player4_dark_" + LanguageManager.shortlang)
					else:
						ShimejiCharacter_Playable_p4.player_position.play("player4_" + LanguageManager.shortlang)
	
	if livesmax == 0:
		if CharactersManager.is_mod:
			multiplayer_cam.remove_target(ShimejiCharacter_PlayableMod)
			ShimejiCharacter_PlayableMod.levelcompleted()
		else:
			multiplayer_cam.remove_target(ShimejiCharacter_Playable)
			ShimejiCharacter_Playable.levelcompleted()

	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if livesmax_p2 == 0:
				if CharactersManager.is_mod_p2:
					multiplayer_cam.remove_target(ShimejiCharacter_PlayableMod_p2)
					ShimejiCharacter_PlayableMod_p2.levelcompleted()
				else:
					multiplayer_cam.remove_target(ShimejiCharacter_Playable_p2)
					ShimejiCharacter_Playable_p2.levelcompleted()
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if livesmax_p3 == 0:
				if CharactersManager.is_mod_p3:
					multiplayer_cam.remove_target(ShimejiCharacter_PlayableMod_p3)
					ShimejiCharacter_PlayableMod_p3.levelcompleted()
				else:
					multiplayer_cam.remove_target(ShimejiCharacter_Playable_p3)
					ShimejiCharacter_Playable_p3.levelcompleted()
		if ModeManager.multi_4players:
			if livesmax_p4 == 0:
				if CharactersManager.is_mod_p4:
					multiplayer_cam.remove_target(ShimejiCharacter_PlayableMod_p4)
					ShimejiCharacter_PlayableMod_p4.levelcompleted()
				else:
					multiplayer_cam.remove_target(ShimejiCharacter_Playable_p4)
					ShimejiCharacter_Playable_p4.levelcompleted()

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
				
#Portrait darkens if the player ran out of lives.
	if livesmax == 0:
		score_char_portrait.self_modulate = Color("#808080")
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if livesmax_p2 == 0:
				score_char_portrait_p2.self_modulate = Color("#808080")
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if livesmax_p3 == 0:
				score_char_portrait_p3.self_modulate = Color("#808080")
		if ModeManager.multi_4players:
			if livesmax_p4 == 0:
				score_char_portrait_p4.self_modulate = Color("#808080")

#Already Collected Secret Triangles Codes. (Only for Story Mode)
	spawn_bluetriangles()

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

func respawn_shimeji_player2():
	if CharactersManager.is_mod_p2:
		if ShimejiCharacter_PlayableMod_p2.has_respawned == false:
			if current_checkpoint_p2 != null:
				ShimejiCharacter_PlayableMod_p2.position = current_checkpoint_p2.global_position
			else:
				ShimejiCharacter_PlayableMod_p2.position = character_spawn_player_2.global_position
			ShimejiCharacter_PlayableMod_p2.has_respawned = true
			health_p2 += 5
			score_char_health_p2.animation = str(health_p2)
			score_char_health_dark_p2.animation = str(health_p2)
		else:
			return
	else:
		if ShimejiCharacter_Playable_p2.has_respawned == false:
			if current_checkpoint_p2 != null:
				ShimejiCharacter_Playable_p2.position = current_checkpoint_p2.global_position
			else:
				ShimejiCharacter_Playable_p2.position = character_spawn_player_2.global_position
			ShimejiCharacter_Playable_p2.has_respawned = true
			health_p2 += 5
			score_char_health_p2.animation = str(health_p2)
			score_char_health_dark_p2.animation = str(health_p2)
		else:
			return
		
func respawn_shimeji_player3():
	if CharactersManager.is_mod_p3:
		if ShimejiCharacter_PlayableMod_p3.has_respawned == false:
			if current_checkpoint_p3 != null:
				ShimejiCharacter_PlayableMod_p3.position = current_checkpoint_p3.global_position
			else:
				ShimejiCharacter_PlayableMod_p3.position = character_spawn_player_3.global_position
			ShimejiCharacter_PlayableMod_p3.has_respawned = true
			health_p3 += 5
			score_char_health_p3.animation = str(health_p3)
			score_char_health_dark_p3.animation = str(health_p3)
		else:
			return
	else:
		if ShimejiCharacter_Playable_p3.has_respawned == false:
			if current_checkpoint_p3 != null:
				ShimejiCharacter_Playable_p3.position = current_checkpoint_p3.global_position
			else:
				ShimejiCharacter_Playable_p3.position = character_spawn_player_3.global_position
			ShimejiCharacter_Playable_p3.has_respawned = true
			health_p3 += 5
			score_char_health_p3.animation = str(health_p3)
			score_char_health_dark_p3.animation = str(health_p3)
		else:
			return
		
func respawn_shimeji_player4():
	if CharactersManager.is_mod_p4:
		if ShimejiCharacter_PlayableMod_p4.has_respawned == false:
			if current_checkpoint_p4 != null:
				ShimejiCharacter_PlayableMod_p4.position = current_checkpoint_p4.global_position
			else:
				ShimejiCharacter_PlayableMod_p4.position = character_spawn_player_4.global_position
			ShimejiCharacter_PlayableMod_p4.has_respawned = true
			health_p4 += 5
			score_char_health_p4.animation = str(health_p4)
			score_char_health_dark_p4.animation = str(health_p4)
		else:
			return
	else:
		if ShimejiCharacter_Playable_p4.has_respawned == false:
			if current_checkpoint_p4 != null:
				ShimejiCharacter_Playable_p4.position = current_checkpoint_p4.global_position
			else:
				ShimejiCharacter_Playable_p4.position = character_spawn_player_4.global_position
			ShimejiCharacter_Playable_p4.has_respawned = true
			health_p4 += 5
			score_char_health_p4.animation = str(health_p4)
			score_char_health_dark_p4.animation = str(health_p4)
		else:
			return
		
func teleport_shimeji():
	if CharactersManager.is_mod:
		if !ShimejiCharacter_PlayableMod.is_dead && ShimejiCharacter_PlayableMod.velocity.x == 0 && ShimejiCharacter_PlayableMod.velocity.y == 0:
			if current_checkpoint != null:
				ShimejiCharacter_PlayableMod.position = current_checkpoint.global_position
			else:
				ShimejiCharacter_PlayableMod.position = character_spawn.global_position
	else:
		if !ShimejiCharacter_Playable.is_dead:
			if current_checkpoint != null:
				ShimejiCharacter_Playable.position = current_checkpoint.global_position
			else:
				ShimejiCharacter_Playable.position = character_spawn.global_position

func teleport_shimeji_player2():
	if CharactersManager.is_mod_p2:
		if !ShimejiCharacter_PlayableMod_p2.is_dead:
			if CharactersManager.is_mod:
				ShimejiCharacter_PlayableMod_p2.position = ShimejiCharacter_PlayableMod.global_position
			else:
				ShimejiCharacter_PlayableMod_p2.position = ShimejiCharacter_Playable.global_position
	else:
		if !ShimejiCharacter_Playable_p2.is_dead:
			if CharactersManager.is_mod:
				ShimejiCharacter_Playable_p2.position = ShimejiCharacter_PlayableMod.global_position
			else:
				ShimejiCharacter_Playable_p2.position = ShimejiCharacter_Playable.global_position

func teleport_shimeji_player3():
	if CharactersManager.is_mod_p3:
		if !ShimejiCharacter_PlayableMod_p3.is_dead:
			if CharactersManager.is_mod:
				ShimejiCharacter_PlayableMod_p3.position = ShimejiCharacter_PlayableMod.global_position
			else:
				ShimejiCharacter_PlayableMod_p3.position = ShimejiCharacter_Playable.global_position
	else:
		if !ShimejiCharacter_Playable_p3.is_dead:
			if CharactersManager.is_mod:
				ShimejiCharacter_Playable_p3.position = ShimejiCharacter_PlayableMod.global_position
			else:
				ShimejiCharacter_Playable_p3.position = ShimejiCharacter_Playable.global_position

func teleport_shimeji_player4():
	if CharactersManager.is_mod_p4:
		if !ShimejiCharacter_PlayableMod_p4.is_dead:
			if CharactersManager.is_mod:
				ShimejiCharacter_PlayableMod_p4.position = ShimejiCharacter_PlayableMod.global_position
			else:
				ShimejiCharacter_PlayableMod_p4.position = ShimejiCharacter_Playable.global_position
	else:
		if !ShimejiCharacter_Playable_p4.is_dead:
			if CharactersManager.is_mod:
				ShimejiCharacter_Playable_p4.position = ShimejiCharacter_PlayableMod.global_position
			else:
				ShimejiCharacter_Playable_p4.position = ShimejiCharacter_Playable.global_position

func add_point():
	points += 1
	if points == 1 or points == 2 or points == 3 or points == 4 or points == 5 or points == 6 or points == 7 or points == 8 or points == 9:
		score_numbers_u.play(str(points))
		score_numbers_dark_u.play(str(points))
	if points == 10 or points == 20 or points == 30 or points == 40 or points == 50 or points == 60 or points == 70 or points == 80 or points == 90:
		pointst += 1
		score_numbers_t.play(str(pointst))
		score_numbers_dark_t.play(str(pointst))
		points = 0
		score_numbers_u.play(str(points))
		score_numbers_dark_u.play(str(points))
	if pointst == 10 or pointst == 20 or pointst == 30 or pointst == 40 or pointst == 50 or pointst == 60 or pointst == 70 or pointst == 80 or pointst == 90:
		pointsh += 1
		score_numbers_h.play(str(pointsh))
		score_numbers_dark_h.play(str(pointsh))
		pointst = 0
		score_numbers_t.play(str(pointst))
		score_numbers_dark_t.play(str(pointst))
		points = 0
		score_numbers_u.play(str(points))
		score_numbers_dark_u.play(str(points))

func add_point_player2():
	points_p2 += 1
	if points_p2 == 1 or points_p2 == 2 or points_p2 == 3 or points_p2 == 4 or points_p2 == 5 or points_p2 == 6 or points_p2 == 7 or points_p2 == 8 or points_p2 == 9:
		score_numbers_u_p2.play(str(points_p2))
		score_numbers_dark_u_p2.play(str(points_p2))
	if points_p2 == 10 or points_p2 == 20 or points_p2 == 30 or points_p2 == 40 or points_p2 == 50 or points_p2 == 60 or points_p2 == 70 or points_p2 == 80 or points_p2 == 90:
		pointst_p2 += 1
		score_numbers_t_p2.play(str(pointst_p2))
		score_numbers_dark_t_p2.play(str(pointst_p2))
		points_p2 = 0
		score_numbers_u_p2.play(str(points_p2))
		score_numbers_dark_u_p2.play(str(points_p2))
	if pointst_p2 == 10 or pointst_p2 == 20 or pointst_p2 == 30 or pointst_p2 == 40 or pointst_p2 == 50 or pointst_p2 == 60 or pointst_p2 == 70 or pointst_p2 == 80 or pointst_p2 == 90:
		pointsh_p2 += 1
		score_numbers_h_p2.play(str(pointsh_p2))
		score_numbers_dark_h_p2.play(str(pointsh_p2))
		pointst_p2 = 0
		score_numbers_t_p2.play(str(pointst_p2))
		score_numbers_dark_t_p2.play(str(pointst_p2))
		points_p2 = 0
		score_numbers_u_p2.play(str(points_p2))
		score_numbers_dark_u_p2.play(str(points_p2))

func add_points_player3():
	points_p3 += 1
	if points_p3 == 1 or points_p3 == 2 or points_p3 == 3 or points_p3 == 4 or points_p3 == 5 or points_p3 == 6 or points_p3 == 7 or points_p3 == 8 or points_p3 == 9:
		score_numbers_u_p3.play(str(points_p3))
		score_numbers_dark_u_p3.play(str(points_p3))
	if points_p3 == 10 or points_p3 == 20 or points_p3 == 30 or points_p3 == 40 or points_p3 == 50 or points_p3 == 60 or points_p3 == 70 or points_p3 == 80 or points_p3 == 90:
		pointst_p3 += 1
		score_numbers_t_p3.play(str(pointst_p3))
		score_numbers_dark_t_p3.play(str(pointst_p3))
		points_p3 = 0
		score_numbers_u_p3.play(str(points_p3))
		score_numbers_dark_u_p3.play(str(points_p3))
	if pointst_p3 == 10 or pointst_p3 == 20 or pointst_p3 == 30 or pointst_p3 == 40 or pointst_p3 == 50 or pointst_p3 == 60 or pointst_p3 == 70 or pointst_p3 == 80 or pointst_p3 == 90:
		pointsh_p3 += 1
		score_numbers_h_p3.play(str(pointsh_p3))
		score_numbers_dark_h_p3.play(str(pointsh_p3))
		pointst_p3 = 0
		score_numbers_t_p3.play(str(pointst_p3))
		score_numbers_dark_t_p3.play(str(pointst_p3))
		points_p3 = 0
		score_numbers_u_p3.play(str(points_p3))
		score_numbers_dark_u_p3.play(str(points_p3))

func add_points_player4():
			points_p4 += 1
			if points_p4 == 1 or points_p4 == 2 or points_p4 == 3 or points_p4 == 4 or points_p4 == 5 or points_p4 == 6 or points_p4 == 7 or points_p4 == 8 or points_p4 == 9:
				score_numbers_u_p4.play(str(points_p4))
				score_numbers_dark_u_p4.play(str(points_p4))
			if points_p4 == 10 or points_p4 == 20 or points_p4 == 30 or points_p4 == 40 or points_p4 == 50 or points_p4 == 60 or points_p4 == 70 or points_p4 == 80 or points_p4 == 90:
				pointst_p4 += 1
				score_numbers_t_p4.play(str(pointst_p4))
				score_numbers_dark_t_p4.play(str(pointst_p4))
				points_p4 = 0
				score_numbers_u_p4.play(str(points_p4))
				score_numbers_dark_u_p4.play(str(points_p4))
			if pointst_p4 == 10 or pointst_p4 == 20 or pointst_p4 == 30 or pointst_p4 == 40 or pointst_p4 == 50 or pointst_p4 == 60 or pointst_p4 == 70 or pointst_p4 == 80 or pointst_p4 == 90:
				pointsh_p4 += 1
				score_numbers_h_p4.play(str(pointsh_p4))
				score_numbers_dark_h_p4.play(str(pointsh_p4))
				pointst_p4 = 0
				score_numbers_t_p4.play(str(pointst_p4))
				score_numbers_dark_t_p4.play(str(pointst_p4))
				points_p4 = 0
				score_numbers_u_p4.play(str(points_p4))
				score_numbers_dark_u_p4.play(str(points_p4))

func add_lives():
	if ModeManager.is_story:
		if ModeManager.is_savefile1:
			lives += 1
			livesmax += 1
			if lives == 10 or lives == 20 or lives == 30 or lives == 40 or lives == 50 or lives == 60 or lives == 70 or lives == 80 or lives == 90:
				livest += 1
				score_numbers_life_t.play(str(livest))
				score_numbers_life_dark_t.play(str(livest))
				lives = 0
				score_numbers_life_u.play(str(lives))
				score_numbers_life_dark_u.play(str(lives))
			SaveFileManager.new_life()
	else:
		lives += 1
		livesmax += 1
		if lives == 10 or lives == 20 or lives == 30 or lives == 40 or lives == 50 or lives == 60 or lives == 70 or lives == 80 or lives == 90:
			livest += 1
			score_numbers_life_t.play(str(livest))
			score_numbers_life_dark_t.play(str(livest))
			lives = 0
			score_numbers_life_u.play(str(lives))
			score_numbers_life_dark_u.play(str(lives))
	score_numbers_life_u.animation = str(lives)
	score_numbers_life_dark_u.animation = str(lives)
	print("Max Lives: " + str(livesmax))
	print("Lives: " + str(lives))
	print("Lives (Ten): " + str(livest))
	
func add_lives_player2():
	lives_p2 += 1
	livesmax_p2 += 1
	if lives_p2 == 10 or lives_p2 == 20 or lives_p2 == 30 or lives_p2 == 40 or lives_p2 == 50 or lives_p2 == 60 or lives_p2 == 70 or lives_p2 == 80 or lives_p2 == 90:
		livest_p2 += 1
		score_numbers_life_t_p2.play(str(livest_p2))
		score_numbers_life_dark_t_p2.play(str(livest_p2))
		lives_p2 = 0
		score_numbers_life_u_p2.play(str(lives_p2))
		score_numbers_life_dark_u_p2.play(str(lives_p2))
	score_numbers_life_u_p2.play(str(lives_p2))
	score_numbers_life_dark_u_p2.play(str(lives_p2))
	print("Max Lives (Player 2): " + str(livesmax_p2))
	print("Lives (Player 2): " + str(lives_p2))
	print("Lives (Ten) (Player 2): " + str(livest_p2))

func add_lives_player3():
	lives_p3 += 1
	livesmax_p3 += 1
	if lives_p3 == 10 or lives_p3 == 20 or lives_p3 == 30 or lives_p3 == 40 or lives_p3 == 50 or lives_p3 == 60 or lives_p3 == 70 or lives_p3 == 80 or lives_p3 == 90:
		livest_p3 += 1
		score_numbers_life_t_p3.play(str(livest_p3))
		score_numbers_life_dark_t_p3.play(str(livest_p3))
		lives_p3 = 0
		score_numbers_life_u_p3.play(str(lives_p3))
		score_numbers_life_dark_u_p3.play(str(lives_p3))
	score_numbers_life_u_p3.play(str(lives_p3))
	score_numbers_life_dark_u_p3.play(str(lives_p3))
	print("Max Lives (Player 3): " + str(livesmax_p3))
	print("Lives (Player 3): " + str(lives_p3))
	print("Lives (Ten) (Player 3): " + str(livest_p3))

func add_lives_player4():
	lives_p4 += 1
	livesmax_p4 += 1
	if lives_p4 == 10 or lives_p4 == 20 or lives_p4 == 30 or lives_p4 == 40 or lives_p4 == 50 or lives_p4 == 60 or lives_p4 == 70 or lives_p4 == 80 or lives_p4 == 90:
		livest_p4 += 1
		score_numbers_life_t_p4.play(str(livest_p4))
		score_numbers_life_dark_t_p4.play(str(livest_p4))
		lives_p4 = 0
		score_numbers_life_u_p4.play(str(lives_p4))
		score_numbers_life_dark_u_p4.play(str(lives_p4))
	score_numbers_life_u_p4.play(str(lives_p4))
	score_numbers_life_dark_u_p4.play(str(lives_p4))
	print("Max Lives (Player 4): " + str(livesmax_p4))
	print("Lives (Player 4): " + str(lives_p4))
	print("Lives (Ten) (Player 4): " + str(livest_p4))

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

func lose_health_player2():
	health_p2 -= 1
	score_char_health_p2.animation = str(health_p2)
	score_char_health_dark_p2.animation = str(health_p2)
	if health_p2 == 0:
		lose_lives_player2()

func lose_health_player3():
	health_p3 -= 1
	score_char_health_p3.animation = str(health_p3)
	score_char_health_dark_p3.animation = str(health_p3)
	if health_p3 == 0:
		lose_lives_player3()

func lose_health_player4():
	health_p4 -= 1
	score_char_health_p4.animation = str(health_p4)
	score_char_health_dark_p4.animation = str(health_p4)
	if health_p4 == 0:
		lose_lives_player4()
	
func lose_lives():
	if ModeManager.is_story:
		if ModeManager.is_savefile1:
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

func lose_lives_player2():
	lives_p2 -= 1
	livesmax_p2 -= 1
	if livesmax_p2 == 9 or livesmax_p2 == 19 or livesmax_p2 == 29 or livesmax_p2 == 39 or livesmax_p2 == 49 or livesmax_p2 == 59 or livesmax_p2 == 69 or livesmax_p2 == 79 or livesmax_p2 == 89:
		livest_p2 -= 1
		score_numbers_life_t_p2.animation = str(livest_p2)
		score_numbers_life_dark_t_p2.animation = str(livest_p2)
		lives_p2 = 9
		score_numbers_life_u_p2.animation = str(lives_p2)
		score_numbers_life_dark_u_p2.animation = str(lives_p2)
	score_numbers_life_u_p2.animation = str(lives_p2)
	score_numbers_life_dark_u_p2.animation = str(lives_p2)
	print("Max Lives (Player 2): " + str(livesmax_p2))
	print("Lives (Player 2): " + str(lives_p2))
	print("Lives (Ten) (Player 2): " + str(livest_p2))
				
func lose_lives_player3():
	lives_p3 -= 1
	livesmax_p3 -= 1
	if livesmax_p3 == 9 or livesmax_p3 == 19 or livesmax_p3 == 29 or livesmax_p3 == 39 or livesmax_p3 == 49 or livesmax_p3 == 59 or livesmax_p3 == 69 or livesmax_p3 == 79 or livesmax_p3 == 89:
		livest_p3 -= 1
		score_numbers_life_t_p3.animation = str(livest_p3)
		score_numbers_life_dark_t_p3.animation = str(livest_p3)
		lives_p3 = 9
		score_numbers_life_u_p3.animation = str(lives_p3)
		score_numbers_life_dark_u_p3.animation = str(lives_p3)
	score_numbers_life_u_p3.animation = str(lives_p3)
	score_numbers_life_dark_u_p3.animation = str(lives_p3)
	print("Max Lives (Player 3): " + str(livesmax_p3))
	print("Lives (Player 3): " + str(lives_p3))
	print("Lives (Ten) (Player 3): " + str(livest_p3))

func lose_lives_player4():
	lives_p4 -= 1
	livesmax_p4 -= 1
	if livesmax_p4 == 9 or livesmax_p4 == 19 or livesmax_p4 == 29 or livesmax_p4 == 39 or livesmax_p4 == 49 or livesmax_p4 == 59 or livesmax_p4 == 69 or livesmax_p4 == 79 or livesmax_p4 == 89:
		livest_p4 -= 1
		score_numbers_life_t_p4.animation = str(livest_p4)
		score_numbers_life_dark_t_p4.animation = str(livest_p4)
		lives_p4 = 9
		score_numbers_life_u_p4.animation = str(lives_p4)
		score_numbers_life_dark_u_p4.animation = str(lives_p4)
	score_numbers_life_u_p4.animation = str(lives_p4)
	score_numbers_life_dark_u_p4.animation = str(lives_p4)
	print("Max Lives (Player 4): " + str(livesmax_p4))
	print("Lives (Player 4): " + str(lives_p4))
	print("Lives (Ten) (Player 4): " + str(livest_p4))
	
func boss_lose_health():
	boss_health -= 1
	boss_health_bar.animation = str(boss_health)

func onehit_death():
	health = 0
	score_char_health.animation = str(health)
	score_char_health_dark.animation = str(health)
	lose_lives()

func onehit_death_player2():
			health_p2 = 0
			score_char_health_p2.animation = str(health_p2)
			score_char_health_dark_p2.animation = str(health_p2)
			lose_lives_player2()
			
func onehit_death_player3():
			health_p3 = 0
			score_char_health_p3.animation = str(health_p3)
			score_char_health_dark_p3.animation = str(health_p3)
			lose_lives_player3()

func onehit_death_player4():
			health_p4 = 0
			score_char_health_p4.animation = str(health_p4)
			score_char_health_dark_p4.animation = str(health_p4)
			lose_lives_player4()
			
func load_gameover():
	LoadManager.load_scene("res://scenes/gameover/game_over.tscn")

func cutscenemode_on():
	is_incutscene = true
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_p2.is_incutscene = true
			else:
				ShimejiCharacter_Playable_p2.is_incutscene = true
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_p3.is_incutscene = true
			else:
				ShimejiCharacter_Playable_p3.is_incutscene = true
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_p4.is_incutscene = true
			else:
				ShimejiCharacter_Playable_p4.is_incutscene = true
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.is_incutscene = true
	else:
		ShimejiCharacter_Playable.is_incutscene = true
	
func cutscenemode_off():
	is_incutscene = false
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_p2.is_incutscene = false
			else:
				ShimejiCharacter_Playable_p2.is_incutscene = false
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_p3.is_incutscene = false
			else:
				ShimejiCharacter_Playable_p3.is_incutscene = false
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_p4.is_incutscene = false
			else:
				ShimejiCharacter_Playable_p4.is_incutscene = false
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

func add_health_player2():
			if health_p2 == 5:
				health_p2 += 0
				score_char_health_p2.animation = str(health_p2)
				score_char_health_dark_p2.animation = str(health_p2)
				#Then it won't add any health...
			else:
				health_p2 += 1
				score_char_health_p2.animation = str(health_p2)
				score_char_health_dark_p2.animation = str(health_p2)
				
func add_health_player3():
			if health_p3 == 5:
				health_p3 += 0
				score_char_health_p3.animation = str(health_p3)
				score_char_health_dark_p3.animation = str(health_p3)
				#Then it won't add any health...
			else:
				health_p3 += 1
				score_char_health_p3.animation = str(health_p3)
				score_char_health_dark_p3.animation = str(health_p3)
				
func add_health_player4():
			if health_p4 == 5:
				health_p4 += 0
				score_char_health_p4.animation = str(health_p4)
				score_char_health_dark_p4.animation = str(health_p4)
				#Then it won't add any health...
			else:
				health_p4 += 1
				score_char_health_p4.animation = str(health_p4)
				score_char_health_dark_p4.animation = str(health_p4)
				
func get_nodes_in_scene(scene:Node) -> Array:
	var nodes = [scene]
	for child in scene.get_children():
		nodes.append_array(get_nodes_in_scene(child))
	
	return nodes

#Tutorial Cutscene stuff

func _on_cutscene_tutorial_double_jump_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4"):
		play_cutscene_doublejump = true
		tutorial_doublejump_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_triangles_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4"):
		play_cutscene_triangles = true
		tutorial_triangles_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_crouching_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4"):
		play_cutscene_crouch = true
		tutorial_crouching_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_enemy_and_slam_dash_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4"):
		play_cutscene_enemy = true
		tutorial_enemy_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_other_collectables_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4"):
		play_cutscene_collectable = true
		tutorial_collectable_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_checkpoints_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4"):
		play_cutscene_checkpoint = true
		tutorial_checkpoint_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_other_mechanics_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4"):
		play_cutscene_others = true
		tutorial_others_collision.call_deferred("queue_free") 


func _on_cutscene_tutorial_end_star_outro_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4"):
		play_cutscene_ending = true
		tutorial_ending_collision.call_deferred("queue_free") 
		
func finish_boss():
	boss_defeat = true
	level_bgm.stop()
	level_boss_clear.play()
	boss_finish_screen_anim.play("bossfinish_screen")

func spawn_bluetriangles():
	if ModeManager.is_story && !ModeManager.isin_worldmap && !LevelsManager.is_bossbattle:
		match LevelsManager.levelname:
			"tutorial":
				if SaveFileManager.world1_tutorial_dic["hasbeencompleted"]:
					if SaveFileManager.world1_tutorial_dic["trianglecollected1"] && !ac_trianglespawn1:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path1 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle1 = load(triangle_already_path1).instantiate()
						if secret_triangle != null:
							AC_Triangle1.global_position = secret_triangle.global_position
							scene.remove_child(secret_triangle)
							scene.add_child(AC_Triangle1)
							AC_Triangle1.name = secret_triangle.name
						triangle_counter_1.play("found")
						pause.triangle_counter_1.play("found")
						results.triangle_counter_1.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						print("AC_Triangle is here!")
						ac_trianglespawn1 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world1_tutorial_dic["trianglecollected2"] && !ac_trianglespawn2:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path2 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle2 = load(triangle_already_path2).instantiate()
						if secret_triangle_2 != null:
							AC_Triangle2.global_position = secret_triangle_2.global_position
							scene.remove_child(secret_triangle_2)
							scene.add_child(AC_Triangle2)
							AC_Triangle2.name = secret_triangle_2.name
						triangle_counter_2.play("found")
						pause.triangle_counter_2.play("found")
						results.triangle_counter_2.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn2 = true #So it wouldn't spam and lag the game.

					if SaveFileManager.world1_tutorial_dic["trianglecollected3"] && !ac_trianglespawn3:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path3 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle3 = load(triangle_already_path3).instantiate()
						if secret_triangle_3 != null:
							AC_Triangle3.global_position = secret_triangle_3.global_position
							scene.remove_child(secret_triangle_3)
							scene.add_child(AC_Triangle3)
							AC_Triangle3.name = secret_triangle_3.name
						triangle_counter_3.play("found")
						pause.triangle_counter_3.play("found")
						results.triangle_counter_3.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn3 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world1_tutorial_dic["trianglecollected4"] && !ac_trianglespawn4:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path4 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle4 = load(triangle_already_path4).instantiate()
						if secret_triangle_4 != null:
							AC_Triangle4.global_position = secret_triangle_4.global_position
							scene.remove_child(secret_triangle_4)
							scene.add_child(AC_Triangle4)
							AC_Triangle4.name = secret_triangle_4.name
						triangle_counter_4.play("found")
						pause.triangle_counter_4.play("found")
						results.triangle_counter_4.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn4 = true #So it wouldn't spam and lag the game.
			"level1":
				if SaveFileManager.world1_level1_dic["hasbeencompleted"]:
					if SaveFileManager.world1_level1_dic["trianglecollected1"] && !ac_trianglespawn1:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path1 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle1 = load(triangle_already_path1).instantiate()
						if secret_triangle != null:
							AC_Triangle1.global_position = secret_triangle.global_position
							scene.remove_child(secret_triangle)
							scene.add_child(AC_Triangle1)
							AC_Triangle1.name = secret_triangle.name
						triangle_counter_1.play("found")
						pause.triangle_counter_1.play("found")
						results.triangle_counter_1.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						print("AC_Triangle is here!")
						ac_trianglespawn1 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world1_level1_dic["trianglecollected2"] && !ac_trianglespawn2:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path2 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle2 = load(triangle_already_path2).instantiate()
						if secret_triangle_2 != null:
							AC_Triangle2.global_position = secret_triangle_2.global_position
							scene.remove_child(secret_triangle_2)
							scene.add_child(AC_Triangle2)
							AC_Triangle2.name = secret_triangle_2.name
						triangle_counter_2.play("found")
						pause.triangle_counter_2.play("found")
						results.triangle_counter_2.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn2 = true #So it wouldn't spam and lag the game.

					if SaveFileManager.world1_level1_dic["trianglecollected3"] && !ac_trianglespawn3:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path3 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle3 = load(triangle_already_path3).instantiate()
						if secret_triangle_3 != null:
							AC_Triangle3.global_position = secret_triangle_3.global_position
							scene.remove_child(secret_triangle_3)
							scene.add_child(AC_Triangle3)
							AC_Triangle3.name = secret_triangle_3.name
						triangle_counter_3.play("found")
						pause.triangle_counter_3.play("found")
						results.triangle_counter_3.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn3 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world1_level1_dic["trianglecollected4"] && !ac_trianglespawn4:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path4 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle4 = load(triangle_already_path4).instantiate()
						if secret_triangle_4 != null:
							AC_Triangle4.global_position = secret_triangle_4.global_position
							scene.remove_child(secret_triangle_4)
							scene.add_child(AC_Triangle4)
							AC_Triangle4.name = secret_triangle_4.name
						triangle_counter_4.play("found")
						pause.triangle_counter_4.play("found")
						results.triangle_counter_4.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn4 = true #So it wouldn't spam and lag the game.
			"level2":
				if SaveFileManager.world1_level2_dic["hasbeencompleted"]:
					if SaveFileManager.world1_level2_dic["trianglecollected1"] && !ac_trianglespawn1:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path1 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle1 = load(triangle_already_path1).instantiate()
						if secret_triangle != null:
							AC_Triangle1.global_position = secret_triangle.global_position
							scene.remove_child(secret_triangle)
							scene.add_child(AC_Triangle1)
							AC_Triangle1.name = secret_triangle.name
						triangle_counter_1.play("found")
						pause.triangle_counter_1.play("found")
						results.triangle_counter_1.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						print("AC_Triangle is here!")
						ac_trianglespawn1 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world1_level2_dic["trianglecollected2"] && !ac_trianglespawn2:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path2 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle2 = load(triangle_already_path2).instantiate()
						if secret_triangle_2 != null:
							AC_Triangle2.global_position = secret_triangle_2.global_position
							scene.remove_child(secret_triangle_2)
							scene.add_child(AC_Triangle2)
							AC_Triangle2.name = secret_triangle_2.name
						triangle_counter_2.play("found")
						pause.triangle_counter_2.play("found")
						results.triangle_counter_2.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn2 = true #So it wouldn't spam and lag the game.

					if SaveFileManager.world1_level2_dic["trianglecollected3"] && !ac_trianglespawn3:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path3 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle3 = load(triangle_already_path3).instantiate()
						if secret_triangle_3 != null:
							AC_Triangle3.global_position = secret_triangle_3.global_position
							scene.remove_child(secret_triangle_3)
							scene.add_child(AC_Triangle3)
							AC_Triangle3.name = secret_triangle_3.name
						triangle_counter_3.play("found")
						pause.triangle_counter_3.play("found")
						results.triangle_counter_3.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn3 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world1_level2_dic["trianglecollected4"] && !ac_trianglespawn4:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path4 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle4 = load(triangle_already_path4).instantiate()
						if secret_triangle_4 != null:
							AC_Triangle4.global_position = secret_triangle_4.global_position
							scene.remove_child(secret_triangle_4)
							scene.add_child(AC_Triangle4)
							AC_Triangle4.name = secret_triangle_4.name
						triangle_counter_4.play("found")
						pause.triangle_counter_4.play("found")
						results.triangle_counter_4.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn4 = true #So it wouldn't spam and lag the game.
			"world2_level1":
				if SaveFileManager.world2_level1_dic["hasbeencompleted"]:
					if SaveFileManager.world2_level1_dic["trianglecollected1"] && !ac_trianglespawn1:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path1 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle1 = load(triangle_already_path1).instantiate()
						if secret_triangle != null:
							AC_Triangle1.global_position = secret_triangle.global_position
							scene.remove_child(secret_triangle)
							scene.add_child(AC_Triangle1)
							AC_Triangle1.name = secret_triangle.name
						triangle_counter_1.play("found")
						pause.triangle_counter_1.play("found")
						results.triangle_counter_1.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						print("AC_Triangle is here!")
						ac_trianglespawn1 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world2_level1_dic["trianglecollected2"] && !ac_trianglespawn2:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path2 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle2 = load(triangle_already_path2).instantiate()
						if secret_triangle_2 != null:
							AC_Triangle2.global_position = secret_triangle_2.global_position
							scene.remove_child(secret_triangle_2)
							scene.add_child(AC_Triangle2)
							AC_Triangle2.name = secret_triangle_2.name
						triangle_counter_2.play("found")
						pause.triangle_counter_2.play("found")
						results.triangle_counter_2.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn2 = true #So it wouldn't spam and lag the game.

					if SaveFileManager.world2_level1_dic["trianglecollected3"] && !ac_trianglespawn3:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path3 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle3 = load(triangle_already_path3).instantiate()
						if secret_triangle_3 != null:
							AC_Triangle3.global_position = secret_triangle_3.global_position
							scene.remove_child(secret_triangle_3)
							scene.add_child(AC_Triangle3)
							AC_Triangle3.name = secret_triangle_3.name
						triangle_counter_3.play("found")
						pause.triangle_counter_3.play("found")
						results.triangle_counter_3.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn3 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world2_level1_dic["trianglecollected4"] && !ac_trianglespawn4:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path4 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle4 = load(triangle_already_path4).instantiate()
						if secret_triangle_4 != null:
							AC_Triangle4.global_position = secret_triangle_4.global_position
							scene.remove_child(secret_triangle_4)
							scene.add_child(AC_Triangle4)
							AC_Triangle4.name = secret_triangle_4.name
						triangle_counter_4.play("found")
						pause.triangle_counter_4.play("found")
						results.triangle_counter_4.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn4 = true #So it wouldn't spam and lag the game.
			"world2_level2":
				if SaveFileManager.world2_level2_dic["hasbeencompleted"]:
					if SaveFileManager.world2_level2_dic["trianglecollected1"] && !ac_trianglespawn1:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path1 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle1 = load(triangle_already_path1).instantiate()
						if secret_triangle != null:
							AC_Triangle1.global_position = secret_triangle.global_position
							scene.remove_child(secret_triangle)
							scene.add_child(AC_Triangle1)
							AC_Triangle1.name = secret_triangle.name
						triangle_counter_1.play("found")
						pause.triangle_counter_1.play("found")
						results.triangle_counter_1.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						print("AC_Triangle is here!")
						ac_trianglespawn1 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world2_level2_dic["trianglecollected2"] && !ac_trianglespawn2:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path2 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle2 = load(triangle_already_path2).instantiate()
						if secret_triangle_2 != null:
							AC_Triangle2.global_position = secret_triangle_2.global_position
							scene.remove_child(secret_triangle_2)
							scene.add_child(AC_Triangle2)
							AC_Triangle2.name = secret_triangle_2.name
						triangle_counter_2.play("found")
						pause.triangle_counter_2.play("found")
						results.triangle_counter_2.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn2 = true #So it wouldn't spam and lag the game.

					if SaveFileManager.world2_level2_dic["trianglecollected3"] && !ac_trianglespawn3:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path3 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle3 = load(triangle_already_path3).instantiate()
						if secret_triangle_3 != null:
							AC_Triangle3.global_position = secret_triangle_3.global_position
							scene.remove_child(secret_triangle_3)
							scene.add_child(AC_Triangle3)
							AC_Triangle3.name = secret_triangle_3.name
						triangle_counter_3.play("found")
						pause.triangle_counter_3.play("found")
						results.triangle_counter_3.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn3 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world2_level2_dic["trianglecollected4"] && !ac_trianglespawn4:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path4 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle4 = load(triangle_already_path4).instantiate()
						if secret_triangle_4 != null:
							AC_Triangle4.global_position = secret_triangle_4.global_position
							scene.remove_child(secret_triangle_4)
							scene.add_child(AC_Triangle4)
							AC_Triangle4.name = secret_triangle_4.name
						triangle_counter_4.play("found")
						pause.triangle_counter_4.play("found")
						results.triangle_counter_4.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn4 = true #So it wouldn't spam and lag the game.
			"world2_level3":
				if SaveFileManager.world2_level3_dic["hasbeencompleted"]:
					if SaveFileManager.world2_level3_dic["trianglecollected1"] && !ac_trianglespawn1:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path1 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle1 = load(triangle_already_path1).instantiate()
						if secret_triangle != null:
							AC_Triangle1.global_position = secret_triangle.global_position
							scene.remove_child(secret_triangle)
							scene.add_child(AC_Triangle1)
							AC_Triangle1.name = secret_triangle.name
						triangle_counter_1.play("found")
						pause.triangle_counter_1.play("found")
						results.triangle_counter_1.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						print("AC_Triangle is here!")
						ac_trianglespawn1 = true #So it wouldn't spam and lag the game.
					
					if SaveFileManager.world2_level3_dic["trianglecollected2"] && !ac_trianglespawn2:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path2 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle2 = load(triangle_already_path2).instantiate()
						if secret_triangle_2 != null:
							AC_Triangle2.global_position = secret_triangle_2.global_position
							scene.remove_child(secret_triangle_2)
							scene.add_child(AC_Triangle2)
							AC_Triangle2.name = secret_triangle_2.name
						triangle_counter_2.play("found")
						pause.triangle_counter_2.play("found")
						results.triangle_counter_2.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn2 = true #So it wouldn't spam and lag the game.

					if SaveFileManager.world2_level3_dic["trianglecollected3"] && !ac_trianglespawn3:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path3 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle3 = load(triangle_already_path3).instantiate()
						if secret_triangle_3 != null:
							AC_Triangle3.global_position = secret_triangle_3.global_position
							scene.remove_child(secret_triangle_3)
							scene.add_child(AC_Triangle3)
							AC_Triangle3.name = secret_triangle_3.name
						triangle_counter_3.play("found")
						pause.triangle_counter_3.play("found")
						results.triangle_counter_3.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn3 = true #So it wouldn't spam and lag the game.
					
					#
					if SaveFileManager.world2_level3_dic["trianglecollected4"] && !ac_trianglespawn4:
						var scene = get_node("../SceneObjects/SecretTriangles")
						triangle_already_path4 = "res://scenes/collectable/secret_triangle_collected.tscn"
						AC_Triangle4 = load(triangle_already_path4).instantiate()
						if secret_triangle_4 != null:
							AC_Triangle4.global_position = secret_triangle_4.global_position
							scene.remove_child(secret_triangle_4)
							scene.add_child(AC_Triangle4)
							AC_Triangle4.name = secret_triangle_4.name
						triangle_counter_4.play("found")
						pause.triangle_counter_4.play("found")
						results.triangle_counter_4.play("found")
						secretfound += 1
						pause.secretfound += 1
						results.secretfound += 1
						ac_trianglespawn4 = true #So it wouldn't spam and lag the game.
			
			_:
				pass
