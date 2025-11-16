extends Node2D
@onready var friend: AnimatedSprite2D = $Friend
@onready var friend_amin: AnimationPlayer = $FriendAmin
@onready var speech_option: AnimationPlayer = $SpeechOption
@onready var game_manager: GameManager = $"../../GameManager"

#VoiceClips
#English
@onready var level_1_part_1_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part1_01
@onready var level_1_part_1_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part1_02
@onready var level_1_part_1_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part1_03
@onready var level_1_part_1_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part1_04
@onready var level_1_part_1_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part1_05
@onready var level_1_part_1_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part1_06
@onready var level_1_part_1_07: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part1_07
@onready var level_1_part_1_08: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part1_08

@onready var level_1_part_2_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part2_01
@onready var level_1_part_2_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part2_02
@onready var level_1_part_2_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part2_03
@onready var level_1_part_2_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part2_04
@onready var level_1_part_2_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part2_05
@onready var level_1_part_2_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part2_06

@onready var level_1_part_3_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part3_01
@onready var level_1_part_3_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part3_02
@onready var level_1_part_3_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part3_03
@onready var level_1_part_3_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part3_04
@onready var level_1_part_3_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part3_05
@onready var level_1_part_3_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part3_06
@onready var level_1_part_3_07: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part3_07

@onready var level_1_part_4_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part4_01
@onready var level_1_part_4_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part4_02
@onready var level_1_part_4_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part4_03
@onready var level_1_part_4_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part4_04
@onready var level_1_part_4_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part4_05
@onready var level_1_part_4_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part4_06
@onready var level_1_part_4_07: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part4_07

@onready var level_1_part_5_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_01
@onready var level_1_part_5_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_02
@onready var level_1_part_5_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_03
@onready var level_1_part_5_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_04
@onready var level_1_part_5_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_05
@onready var level_1_part_5_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_06
@onready var level_1_part_5_07: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_07
@onready var level_1_part_5_08: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_08
@onready var level_1_part_5_09: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_09
@onready var level_1_part_5_10: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part5_10

@onready var level_1_part_6_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part6_01
@onready var level_1_part_6_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part6_02
@onready var level_1_part_6_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part6_03
@onready var level_1_part_6_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part6_04
@onready var level_1_part_6_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part6_05
@onready var level_1_part_6_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part6_06
@onready var level_1_part_6_07: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part6_07
@onready var level_1_part_6_08: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part6_08

@onready var level_1_part_7_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part7_01
@onready var level_1_part_7_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part7_02
@onready var level_1_part_7_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part7_03
@onready var level_1_part_7_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part7_04
@onready var level_1_part_7_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part7_05
@onready var level_1_part_7_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level1_part7_06

@onready var level_2_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level2_01
@onready var level_2_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level2_02
@onready var level_2_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level2_03
@onready var level_2_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level2_04
@onready var level_2_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level2_05
@onready var level_2_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level2_06
@onready var level_2_07: AudioStreamPlayer2D = $Voicelines/Level1/English/level2_07
@onready var level_2_08: AudioStreamPlayer2D = $Voicelines/Level1/English/level2_08

@onready var level_3_01: AudioStreamPlayer2D = $Voicelines/Level1/English/level3_01
@onready var level_3_02: AudioStreamPlayer2D = $Voicelines/Level1/English/level3_02
@onready var level_3_03: AudioStreamPlayer2D = $Voicelines/Level1/English/level3_03
@onready var level_3_04: AudioStreamPlayer2D = $Voicelines/Level1/English/level3_04
@onready var level_3_05: AudioStreamPlayer2D = $Voicelines/Level1/English/level3_05
@onready var level_3_06: AudioStreamPlayer2D = $Voicelines/Level1/English/level3_06
@onready var level_3_07: AudioStreamPlayer2D = $Voicelines/Level1/English/level3_07


var player_in_zone = false
var is_jumping = false
var intro_played = false
var is_leaving = false

var dialouge_part1 = false
var dialouge_part2 = false
var dialouge_part3 = false
var dialouge_part4 = false
var dialouge_part5 = false
var dialouge_part6 = false
var dialouge_part7 = false

var level2_end = false

var level3_end = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func _process(delta: float) -> void:
	if player_in_zone && Input.is_action_just_pressed("chat"):
		if dialouge_part1:
			match LanguageManager.language:
				"spanish":
					run_dialogue("w2level1_part1_" + LanguageManager.shortlang)
				"french":
					run_dialogue("w2level1_part1_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("w2level1_part1_" + LanguageManager.shortlang)
				"german":
					run_dialogue("w2level1_part1_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("w2level1_part1_" + LanguageManager.shortlang)
				_:
					run_dialogue("w2level1_part1")
			game_manager.cutscenemode_on()
		if dialouge_part2:
			match LanguageManager.language:
				"spanish":
					run_dialogue("w2level1_part2_" + LanguageManager.shortlang)
				"french":
					run_dialogue("w2level1_part2_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("w2level1_part2_" + LanguageManager.shortlang)
				"german":
					run_dialogue("w2level1_part2_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("w2level1_part2_" + LanguageManager.shortlang)
				_:
					run_dialogue("w2level1_part2")
			game_manager.cutscenemode_on()
		if dialouge_part3:
			match LanguageManager.language:
				"spanish":
					run_dialogue("w2level1_part3_" + LanguageManager.shortlang)
				"french":
					run_dialogue("w2level1_part3_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("w2level1_part3_" + LanguageManager.shortlang)
				"german":
					run_dialogue("w2level1_part3_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("w2level1_part3_" + LanguageManager.shortlang)
				_:
					run_dialogue("w2level1_part3")
			game_manager.cutscenemode_on()
		if dialouge_part4:
			match LanguageManager.language:
				"spanish":
					run_dialogue("w2level1_part4_" + LanguageManager.shortlang)
				"french":
					run_dialogue("w2level1_part4_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("w2level1_part4_" + LanguageManager.shortlang)
				"german":
					run_dialogue("w2level1_part4_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("w2level1_part4_" + LanguageManager.shortlang)
				_:
					run_dialogue("w2level1_part4")
			game_manager.cutscenemode_on()
		if dialouge_part5:
			match LanguageManager.language:
				"spanish":
					run_dialogue("w2level1_part5_" + LanguageManager.shortlang)
				"french":
					run_dialogue("w2level1_part5_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("w2level1_part5_" + LanguageManager.shortlang)
				"german":
					run_dialogue("w2level1_part5_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("w2level1_part5_" + LanguageManager.shortlang)
				_:
					run_dialogue("w2level1_part5")
			game_manager.cutscenemode_on()
		if dialouge_part6:
			match LanguageManager.language:
				"spanish":
					run_dialogue("w2level1_part6_" + LanguageManager.shortlang)
				"french":
					run_dialogue("w2level1_part6_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("w2level1_part6_" + LanguageManager.shortlang)
				"german":
					run_dialogue("w2level1_part6_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("w2level1_part6_" + LanguageManager.shortlang)
				_:
					run_dialogue("w2level1_part6")
			game_manager.cutscenemode_on()
		if dialouge_part7:
			match LanguageManager.language:
				"spanish":
					run_dialogue("w2level1_part7_" + LanguageManager.shortlang)
				"french":
					run_dialogue("w2level1_part7_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("w2level1_part7_" + LanguageManager.shortlang)
				"german":
					run_dialogue("w2level1_part7_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("w2level1_part7_" + LanguageManager.shortlang)
				_:
					run_dialogue("w2level1_part7")
			game_manager.cutscenemode_on()
		if level2_end:
			match LanguageManager.language:
				"spanish":
					run_dialogue("interflydialogue_shop_" + LanguageManager.shortlang)
				"french":
					run_dialogue("interflydialogue_shop_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("interflydialogue_shop_" + LanguageManager.shortlang)
				"german":
					run_dialogue("interflydialogue_shop_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("interflydialogue_shop_" + LanguageManager.shortlang)
				_:
					run_dialogue("interflydialogue_shop")
			game_manager.cutscenemode_on()
		if level3_end:
			match LanguageManager.language:
				"spanish":
					run_dialogue("w2lv3_conversationending_" + LanguageManager.shortlang)
				"french":
					run_dialogue("w2lv3_conversationending_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("w2lv3_conversationending_" + LanguageManager.shortlang)
				"german":
					run_dialogue("w2lv3_conversationending_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("w2lv3_conversationending_" + LanguageManager.shortlang)
				_:
					run_dialogue("w2lv3_conversationending")
			run_dialogue("w2lv3_conversationending")
			game_manager.cutscenemode_on()

func jumping():
	friend.play("jump")
	is_jumping = true
	
func stop_jumping():
	is_jumping = false

func idle():
	friend.play("idle")
	
func walk():
	friend.play("move")

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
	game_manager.cutscenemode_on()

func DialogicSignal(argument:String):
	if argument == "greet":
		friend.animation = "greet"

	if argument == "flippedon":
		friend.flip_h = true

	if argument == "flippedoff":
		friend.flip_h = false

	if argument == "end_cutscene":
		game_manager.cutscenemode_off()
	
#English VoiceClips
	#VoiceClips - Part1
	if argument == "vclip_p1_01":
		level_1_part_1_01.play()
	if argument == "vclip_p1_02":
		level_1_part_1_01.stop()
		level_1_part_1_02.play()
	if argument == "vclip_p1_03":
		level_1_part_1_02.stop()
		level_1_part_1_03.play()
	if argument == "vclip_p1_04":
		level_1_part_1_03.stop()
		level_1_part_1_04.play()
	if argument == "vclip_p1_05":
		level_1_part_1_04.stop()
		level_1_part_1_05.play()
	if argument == "vclip_p1_06":
		level_1_part_1_05.stop()
		level_1_part_1_06.play()
	if argument == "vclip_p1_07":
		level_1_part_1_06.stop()
		level_1_part_1_07.play()
	if argument == "vclip_p1_08":
		level_1_part_1_07.stop()
		level_1_part_1_08.play()

	#VoiceClips - Part2
	if argument == "vclip_p2_01":
		level_1_part_2_01.play()
	if argument == "vclip_p2_02":
		level_1_part_2_01.stop()
		level_1_part_2_02.play()
	if argument == "vclip_p2_03":
		level_1_part_2_02.stop()
		level_1_part_2_03.play()
	if argument == "vclip_p2_04":
		level_1_part_2_03.stop()
		level_1_part_2_04.play()
	if argument == "vclip_p2_05":
		level_1_part_2_04.stop()
		level_1_part_2_05.play()
	if argument == "vclip_p2_06":
		level_1_part_2_05.stop()
		level_1_part_2_06.play()

	#VoiceClips - Part3
	if argument == "vclip_p3_01":
		level_1_part_3_01.play()
	if argument == "vclip_p3_02":
		level_1_part_3_01.stop()
		level_1_part_3_02.play()
	if argument == "vclip_p3_03":
		level_1_part_3_02.stop()
		level_1_part_3_03.play()
	if argument == "vclip_p3_04":
		level_1_part_3_03.stop()
		level_1_part_3_04.play()
	if argument == "vclip_p3_05":
		level_1_part_3_04.stop()
		level_1_part_3_05.play()
	if argument == "vclip_p3_06":
		level_1_part_3_05.stop()
		level_1_part_3_06.play()
	if argument == "vclip_p3_07":
		level_1_part_3_06.stop()
		level_1_part_3_07.play()

	#VoiceClips - Part4
	if argument == "vclip_p4_01":
		level_1_part_4_01.play()
	if argument == "vclip_p4_02":
		level_1_part_4_01.stop()
		level_1_part_4_02.play()
	if argument == "vclip_p4_03":
		level_1_part_4_02.stop()
		level_1_part_4_03.play()
	if argument == "vclip_p4_04":
		level_1_part_4_03.stop()
		level_1_part_4_04.play()
	if argument == "vclip_p4_05":
		level_1_part_4_04.stop()
		level_1_part_4_05.play()
	if argument == "vclip_p4_06":
		level_1_part_4_05.stop()
		level_1_part_4_06.play()
	if argument == "vclip_p4_07":
		level_1_part_4_06.stop()
		level_1_part_4_07.play()

	#VoiceClips - Part5
	if argument == "vclip_p5_01":
		level_1_part_5_01.play()
	if argument == "vclip_p5_02":
		level_1_part_5_01.stop()
		level_1_part_5_02.play()
	if argument == "vclip_p5_03":
		level_1_part_5_02.stop()
		level_1_part_5_03.play()
	if argument == "vclip_p5_04":
		level_1_part_5_03.stop()
		level_1_part_5_04.play()
	if argument == "vclip_p5_05":
		level_1_part_5_04.stop()
		level_1_part_5_05.play()
	if argument == "vclip_p5_06":
		level_1_part_5_05.stop()
		level_1_part_5_06.play()
	if argument == "vclip_p5_07":
		level_1_part_5_06.stop()
		level_1_part_5_07.play()
	if argument == "vclip_p5_08":
		level_1_part_5_07.stop()
		level_1_part_5_08.play()
	if argument == "vclip_p5_09":
		level_1_part_5_08.stop()
		level_1_part_5_09.play()
	if argument == "vclip_p5_10":
		level_1_part_5_09.stop()
		level_1_part_5_10.play()

	#VoiceClips - Part6
	if argument == "vclip_p6_01":
		level_1_part_6_01.play()
	if argument == "vclip_p6_02":
		level_1_part_6_01.stop()
		level_1_part_6_02.play()
	if argument == "vclip_p6_03":
		level_1_part_6_02.stop()
		level_1_part_6_03.play()
	if argument == "vclip_p6_04":
		level_1_part_6_03.stop()
		level_1_part_6_04.play()
	if argument == "vclip_p6_05":
		level_1_part_6_04.stop()
		level_1_part_6_05.play()
	if argument == "vclip_p6_06":
		level_1_part_6_05.stop()
		level_1_part_6_06.play()
	if argument == "vclip_p6_07":
		level_1_part_6_06.stop()
		level_1_part_6_07.play()
	if argument == "vclip_p6_08":
		level_1_part_6_07.stop()
		level_1_part_6_08.play()

	#VoiceClips - Part7
	if argument == "vclip_p7_01":
		level_1_part_7_01.play()
	if argument == "vclip_p7_02":
		level_1_part_7_01.stop()
		level_1_part_7_02.play()
	if argument == "vclip_p7_03":
		level_1_part_7_02.stop()
		level_1_part_7_03.play()
	if argument == "vclip_p7_04":
		level_1_part_7_03.stop()
		level_1_part_7_04.play()
	if argument == "vclip_p7_05":
		level_1_part_7_04.stop()
		level_1_part_7_05.play()
	if argument == "vclip_p7_06":
		level_1_part_7_05.stop()
		level_1_part_7_06.play()

	#VoiceClips - Level 2 Ending
	if argument == "vclip_lv2_01":
		level_2_01.play()
	if argument == "vclip_lv2_02":
		level_2_01.stop()
		level_2_02.play()
	if argument == "vclip_lv2_03":
		level_2_02.stop()
		level_2_03.play()
	if argument == "vclip_lv2_04":
		level_2_03.stop()
		level_2_04.play()
	if argument == "vclip_lv2_05":
		level_2_04.stop()
		level_2_05.play()
	if argument == "vclip_lv2_06":
		level_2_05.stop()
		level_2_06.play()
	if argument == "vclip_lv2_07":
		level_2_06.stop()
		level_2_07.play()
	if argument == "vclip_lv2_08":
		level_2_07.stop()
		level_2_08.play()

	#VoiceClips - Level 3 Ending
	if argument == "vclip_lv3_01":
		level_3_01.play()
	if argument == "vclip_lv3_02":
		level_3_01.stop()
		level_3_02.play()
	if argument == "vclip_lv3_03":
		level_3_02.stop()
		level_3_03.play()
	if argument == "vclip_lv3_04":
		level_3_03.stop()
		level_3_04.play()
	if argument == "vclip_lv3_05":
		level_3_04.stop()
		level_3_05.play()
	if argument == "vclip_lv3_06":
		level_3_05.stop()
		level_3_06.play()
	if argument == "vclip_lv3_07":
		level_3_06.stop()
		level_3_07.play()
