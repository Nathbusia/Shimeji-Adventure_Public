extends Node
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

#Character UI Thing
@onready var char_name: Label = $"../UI/GUI/CharUIBase/LayoutNameBG/TextureRect/CharName"
@onready var texture_rect: TextureRect = $"../UI/GUI/CharUIBase/LayoutNameBG/TextureRect"
@onready var score_layout_bg_2: TextureRect = $"../UI/GUI/CharUIBase/LayoutMain/Score_LayoutBG2"


var points = 0
var pointst = 0
var pointsh = 0

var lives = 3
var livest = 0

var secretfound = 0

var health = 5

func _process(delta: float) -> void:
	char_name.text = shimeji_character_playable.charname
	texture_rect.modulate = Color(shimeji_character_playable.charcolour)
	score_layout_bg_2.modulate = Color(shimeji_character_playable.charcolour)
	score_char_health.modulate = Color(shimeji_character_playable.charcolour)

func add_point():
	points += 1
	if points == 1 or points == 2 or points == 3 or points == 4 or points == 5 or points == 6 or points == 7 or points == 8 or points == 9:
		score_numbers_u.animation = str(points)
	if points == 10 or points == 20 or points == 30 or points == 40 or points == 50 or points == 60 or points == 70 or points == 80 or points == 90:
		pointst += 1
		score_numbers_t.animation = str(pointst)
		points = 0
		score_numbers_u.animation = str(points)
	if points == 100 or points == 200 or points == 300 or points == 400 or points == 500 or points == 600 or points == 700 or points == 800 or points == 900:
		pointsh += 1
		score_numbers_h.animation = str(pointsh)
		pointst = 0
		score_numbers_t.animation = str(pointst)
		points = 0
		score_numbers_u.animation = str(points)

func add_lives():
	lives += 1
	score_numbers_life_u.animation = str(lives)

func secretfounded():
	secretfound += 1
	if secretfound == 1:
		triangle_counter_1.animation = "found"
	if secretfound == 2:
		triangle_counter_2.animation = "found" 
	if secretfound == 3:
		triangle_counter_3.animation = "found" 
	if secretfound == 4:
		triangle_counter_4.animation = "found" 

func lose_health():
	health -= 1
	score_char_health.animation = str(health)
	if health == 0:
		lives -= 1
		score_numbers_life_u.animation = str(lives)

func onehit_death():
	health = 0
	score_char_health.animation = str(health)
	if health == 0:
		lives -= 1
		score_numbers_life_u.animation = str(lives)

func add_health():
	if health == 5:
		health += 0
		score_char_health.animation = str(health)
		#Then it won't add any health...
	else:
		health += 1
		score_char_health.animation = str(health)
