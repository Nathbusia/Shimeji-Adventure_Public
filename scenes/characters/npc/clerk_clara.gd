extends AnimatableBody2D

@onready var face: AnimatedSprite2D = $Body/Face
@onready var hand: Sprite2D = $Body/Hand
@onready var hand_open: Sprite2D = $Body/Hand_Open
@onready var clara_speak: AudioStreamPlayer2D = $Voices/ClaraSpeak
@onready var clara_speak_sad: AudioStreamPlayer2D = $Voices/ClaraSpeak_Sad
@onready var clara_yippe: AudioStreamPlayer2D = $Voices/ClaraYippe
@onready var success: AudioStreamPlayer2D = $SFX/Success

@onready var clara_anim: AnimationPlayer = $ClaraAnim
@onready var clara_slide: AnimationPlayer = $ClaraSlide
@onready var talk_timer: Timer = $TalkTimer
@onready var game_manager: GameManager = $"../../../GameManager"

var expression = ["normal", "happy", "problem", "sad"]

var player_in_zone = false

var introduction = false
var found_one = false
var found_two = false
var found_three = false
var has_opened = false
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	
func _process(delta: float) -> void:
	if player_in_zone && Input.is_action_just_pressed("chat"):
		if introduction:
			match LanguageManager.language:
				"spanish":
					run_dialogue("claraidialogue_intro_" + LanguageManager.shortlang)
				"french":
					run_dialogue("claraidialogue_intro_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("claraidialogue_intro_" + LanguageManager.shortlang)
				"german":
					run_dialogue("claraidialogue_intro_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("claraidialogue_intro_" + LanguageManager.shortlang)
				_:
					run_dialogue("claraidialogue_intro")
			game_manager.cutscenemode_on()
		if found_one:
			match LanguageManager.language:
				"spanish":
					run_dialogue("claraidialogue_orbone_" + LanguageManager.shortlang)
				"french":
					run_dialogue("claraidialogue_orbone_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("claraidialogue_orbone_" + LanguageManager.shortlang)
				"german":
					run_dialogue("claraidialogue_orbone_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("claraidialogue_orbone_" + LanguageManager.shortlang)
				_:
					run_dialogue("claraidialogue_orbone")
			game_manager.cutscenemode_on()
		if found_two:
			match LanguageManager.language:
				"spanish":
					run_dialogue("claraidialogue_orbtwo_" + LanguageManager.shortlang)
				"french":
					run_dialogue("claraidialogue_orbtwo_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("claraidialogue_orbtwo_" + LanguageManager.shortlang)
				"german":
					run_dialogue("claraidialogue_orbtwo_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("claraidialogue_orbtwo_" + LanguageManager.shortlang)
				_:
					run_dialogue("claraidialogue_orbtwo")
			game_manager.cutscenemode_on()
		if found_three:
			match LanguageManager.language:
				"spanish":
					run_dialogue("claraidialogue_orball_" + LanguageManager.shortlang)
				"french":
					run_dialogue("claraidialogue_orball_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("claraidialogue_orball_" + LanguageManager.shortlang)
				"german":
					run_dialogue("claraidialogue_orball_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("claraidialogue_orball_" + LanguageManager.shortlang)
				_:
					run_dialogue("claraidialogue_orball")
			game_manager.cutscenemode_on()

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func DialogicSignal(argument:String):
	if argument == "talk":
		face.animation = expression + "_talk"
		clara_anim.play("talk")
		talk_timer.start()

	if argument == "normal":
		expression = "normal"

	if argument == "happy":
		expression = "happy"

	if argument == "problem":
		expression = "problem"

	if argument == "sad":
		expression = "sad"

	if argument == "talksound":
		clara_speak.play()

	if argument == "talksound_sad":
		clara_speak_sad.play()

	if argument == "end_cutscene":
		game_manager.cutscenemode_off()
		face.animation = expression
		clara_anim.play("idle")
		talk_timer.stop()
		

func open_sesame():
	if has_opened:
		pass
	else:
		expression = "happy"
		face.animation = expression
		clara_slide.play("slide")
		clara_yippe.play()
		success.play()
		hand.hide()
		hand_open.show()
		has_opened = true

func _on_talk_timer_timeout() -> void:
	face.animation = expression
	clara_anim.play("idle")
	talk_timer.stop()
