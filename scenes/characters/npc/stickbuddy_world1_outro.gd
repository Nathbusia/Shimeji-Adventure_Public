extends Node2D
@onready var friend: AnimatedSprite2D = $Friend
@onready var friend_vox: AudioStreamPlayer2D = $FriendVox
@onready var friend_amin: AnimationPlayer = $FriendAmin
@onready var speech_option: AnimationPlayer = $SpeechOption
@onready var game_manager: GameManager = $"../../../GameManager"

var player_in_zone = false
var is_jumping = false
var intro_played = false
var is_leaving = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func jumping():
	friend.play("jump")
	is_jumping = true
	
func stop_jumping():
	is_jumping = false

func idle():
	friend.play("idle")

func walk():
	friend.play("move")
	
func start_dialogue():
	match LanguageManager.language:
		"spanish":
			run_dialogue("world1_outro_" + LanguageManager.shortlang)
		"french":
			run_dialogue("world1_outro_" + LanguageManager.shortlang)
		"italian":
			run_dialogue("world1_outro_" + LanguageManager.shortlang)
		"german":
			run_dialogue("world1_outro_" + LanguageManager.shortlang)
		"japanese":
			run_dialogue("world1_outro_" + LanguageManager.shortlang)
		_:
			run_dialogue("world1_outro")

func friend_leave():
	is_leaving = true
	friend_amin.play("exit")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		player_in_zone = true
		speech_option.play("popin")


func _on_chat_detection_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		player_in_zone = false
		speech_option.play("popout")


func _on_friend_animation_finished() -> void:
	if !is_jumping:
		idle()
	elif is_leaving:
		return

func time_to_go():
	queue_free()

func start_intro_dialogue():
	intro_played  = false
	run_dialogue("tutorial_intro")
	friend.animation = "wave"
	friend_vox.play()
	game_manager.cutscenemode_on()

func DialogicSignal(argument:String):
	if argument == "talking":
		friend.animation = "talk"
		friend_vox.play()
	
	if argument == "pointing":
		friend.animation = "point"
		friend_vox.play()
	
	if argument == "waving":
		friend.animation = "wave"
		friend_vox.play()

	if argument == "greatest":
		friend.animation = "greatest"
		friend_vox.play()
	
	if argument == "shocked":
		friend.animation = "shock"
		friend_vox.play()
	
	if argument == "welcome":
		friend.animation = "welcome"
		friend_vox.play()

	if argument == "normaltalk":
		friend_vox.play()

	if argument == "flippedon":
		friend.flip_h = true

	if argument == "flippedoff":
		friend.flip_h = false

	if argument == "leaving":
		friend_amin.play("walk_out")
		friend_vox.play()

	if argument == "end_cutscene":
		game_manager.cutscenemode_off()
		friend_leave()
		
	
