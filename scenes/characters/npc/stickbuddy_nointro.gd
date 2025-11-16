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

var play_doublejump_anim = false
var play_triangles_anim = false
var play_crouch_anim = false
var play_enemy_anim = false
var play_collectable_anim = false
var play_checkpoint_anim = false
var play_others_anim = false
var play_ending_anim = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func _process(delta: float) -> void:
	if game_manager.play_cutscene_doublejump == true:
		match LanguageManager.language:
			"spanish":
				run_dialogue("tutorial_doublejump_" + LanguageManager.shortlang)
			"french":
				run_dialogue("tutorial_doublejump_" + LanguageManager.shortlang)
			"italian":
				run_dialogue("tutorial_doublejump_" + LanguageManager.shortlang)
			"german":
				run_dialogue("tutorial_doublejump_" + LanguageManager.shortlang)
			"japanese":
				run_dialogue("tutorial_doublejump_" + LanguageManager.shortlang)
			_:
				run_dialogue("tutorial_doublejump")
		game_manager.play_cutscene_doublejump = false
		play_doublejump_anim = true
		friend.animation = "shock"
		friend.flip_h = true
		friend_vox.play()
		game_manager.cutscenemode_on()

	if game_manager.play_cutscene_triangles == true:
		match LanguageManager.language:
			"spanish":
				run_dialogue("tutorial_triangles_" + LanguageManager.shortlang)
			"french":
				run_dialogue("tutorial_triangles_" + LanguageManager.shortlang)
			"italian":
				run_dialogue("tutorial_triangles_" + LanguageManager.shortlang)
			"german":
				run_dialogue("tutorial_triangles_" + LanguageManager.shortlang)
			"japanese":
				run_dialogue("tutorial_triangles_" + LanguageManager.shortlang)
			_:
				run_dialogue("tutorial_triangles")
		game_manager.play_cutscene_triangles = false
		play_triangles_anim = true
		friend.animation = "point"
		friend_vox.play()
		game_manager.cutscenemode_on()

	if game_manager.play_cutscene_crouch == true:
		match LanguageManager.language:
			"spanish":
				run_dialogue("tutorial_crouch_" + LanguageManager.shortlang)
			"french":
				run_dialogue("tutorial_crouch_" + LanguageManager.shortlang)
			"italian":
				run_dialogue("tutorial_crouch_" + LanguageManager.shortlang)
			"german":
				run_dialogue("tutorial_crouch_" + LanguageManager.shortlang)
			"japanese":
				run_dialogue("tutorial_crouch_" + LanguageManager.shortlang)
			_:
				run_dialogue("tutorial_crouch")
		game_manager.play_cutscene_crouch = false
		play_crouch_anim = true
		friend.animation = "greatest"
		friend.flip_h = true
		friend_vox.play()
		game_manager.cutscenemode_on()

	if game_manager.play_cutscene_enemy == true:
		match LanguageManager.language:
			"spanish":
				run_dialogue("tutorial_enemy_" + LanguageManager.shortlang)
			"french":
				run_dialogue("tutorial_enemy_" + LanguageManager.shortlang)
			"italian":
				run_dialogue("tutorial_enemy_" + LanguageManager.shortlang)
			"german":
				run_dialogue("tutorial_enemy_" + LanguageManager.shortlang)
			"japanese":
				run_dialogue("tutorial_enemy_" + LanguageManager.shortlang)
			_:
				run_dialogue("tutorial_enemy")
		game_manager.play_cutscene_enemy = false
		play_enemy_anim = true
		friend.animation = "shock"
		friend.flip_h = true
		friend_vox.play()
		game_manager.cutscenemode_on()

	if game_manager.play_cutscene_collectable == true:
		if game_manager.health <= 4 || game_manager.health_p2 <= 4 || game_manager.health_p3 <= 4 || game_manager.health_p4 <= 4:
			match LanguageManager.language:
				"spanish":
					run_dialogue("tutorial_collectable_damaged_" + LanguageManager.shortlang)
				"french":
					run_dialogue("tutorial_collectable_damaged_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("tutorial_collectable_damaged_" + LanguageManager.shortlang)
				"german":
					run_dialogue("tutorial_collectable_damaged_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("tutorial_collectable_damaged_" + LanguageManager.shortlang)
				_:
					run_dialogue("tutorial_collectable_damaged")
			game_manager.play_cutscene_collectable = false
			play_collectable_anim = true
			friend.animation = "shock"
			friend_vox.play()
			game_manager.cutscenemode_on()
		else:
			match LanguageManager.language:
				"spanish":
					run_dialogue("tutorial_collectable_" + LanguageManager.shortlang)
				"french":
					run_dialogue("tutorial_collectable_" + LanguageManager.shortlang)
				"italian":
					run_dialogue("tutorial_collectable_" + LanguageManager.shortlang)
				"german":
					run_dialogue("tutorial_collectable_" + LanguageManager.shortlang)
				"japanese":
					run_dialogue("tutorial_collectable_" + LanguageManager.shortlang)
				_:
					run_dialogue("tutorial_collectable")
			game_manager.play_cutscene_collectable = false
			play_collectable_anim = true
			friend.animation = "welcome"
			friend_vox.play()
			game_manager.cutscenemode_on()

	if game_manager.play_cutscene_checkpoint == true:
		match LanguageManager.language:
			"spanish":
				run_dialogue("tutorial_checkpoint_" + LanguageManager.shortlang)
			"french":
				run_dialogue("tutorial_checkpoint_" + LanguageManager.shortlang)
			"italian":
				run_dialogue("tutorial_checkpoint_" + LanguageManager.shortlang)
			"german":
				run_dialogue("tutorial_checkpoint_" + LanguageManager.shortlang)
			"japanese":
				run_dialogue("tutorial_checkpoint_" + LanguageManager.shortlang)
			_:
				run_dialogue("tutorial_checkpoint")
		game_manager.play_cutscene_checkpoint = false
		play_checkpoint_anim = true
		friend.animation = "point"
		friend_vox.play()
		game_manager.cutscenemode_on()

	if game_manager.play_cutscene_others == true:
		match LanguageManager.language:
			"spanish":
				run_dialogue("tutorial_othermechanics_" + LanguageManager.shortlang)
			"french":
				run_dialogue("tutorial_othermechanics_" + LanguageManager.shortlang)
			"italian":
				run_dialogue("tutorial_othermechanics_" + LanguageManager.shortlang)
			"german":
				run_dialogue("tutorial_othermechanics_" + LanguageManager.shortlang)
			"japanese":
				run_dialogue("tutorial_othermechanics_" + LanguageManager.shortlang)
			_:
				run_dialogue("tutorial_othermechanics")
		game_manager.play_cutscene_others = false
		play_others_anim = true
		friend.animation = "greatest"
		friend_vox.play()
		game_manager.cutscenemode_on()

	if game_manager.play_cutscene_ending == true:
		match LanguageManager.language:
			"spanish":
				run_dialogue("tutorial_ending_" + LanguageManager.shortlang)
			"french":
				run_dialogue("tutorial_ending_" + LanguageManager.shortlang)
			"italian":
				run_dialogue("tutorial_ending_" + LanguageManager.shortlang)
			"german":
				run_dialogue("tutorial_ending_" + LanguageManager.shortlang)
			"japanese":
				run_dialogue("tutorial_ending_" + LanguageManager.shortlang)
			_:
				run_dialogue("tutorial_ending")
		game_manager.play_cutscene_ending = false
		play_ending_anim = true
		friend.animation = "welcome"
		friend_vox.play()
		game_manager.cutscenemode_on()
		

func jumping():
	friend.play("jump")
	is_jumping = true
	
func stop_jumping():
	is_jumping = false

func idle():
	friend.play("idle")

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

func DialogicSignal(argument:String):
	if play_doublejump_anim == true:
		if argument == "talkingB":
			friend.animation = "talk"
			friend_vox.play()
		
		if argument == "pointingB":
			friend.animation = "point"
			friend_vox.play()
		
		if argument == "wavingB":
			friend.animation = "wave"
			friend_vox.play()

		if argument == "greatestB":
			friend.animation = "greatest"
			friend_vox.play()
		
		if argument == "shockedB":
			friend.animation = "shock"
			friend_vox.play()
		
		if argument == "welcomeB":
			friend.animation = "welcome"
			friend_vox.play()

		if argument == "normaltalkB":
			friend_vox.play()

		if argument == "flippedon":
			friend.flip_h = true

		if argument == "flippedoff":
			friend.flip_h = false

		if argument == "end_cutsceneB":
			game_manager.cutscenemode_off()
			game_manager.play_cutscene_doublejump = false
			play_doublejump_anim = false
			friend_leave()

	if play_triangles_anim == true:
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

		if argument == "end_cutscene":
			game_manager.cutscenemode_off()
			game_manager.play_cutscene_triangles = false
			play_triangles_anim = false
			friend_leave()
		
	if play_crouch_anim == true:
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

		if argument == "end_cutscene":
			game_manager.cutscenemode_off()
			game_manager.play_cutscene_crouch = false
			play_crouch_anim = false
			friend_leave()

	if play_enemy_anim == true:
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

		if argument == "end_cutscene":
			game_manager.cutscenemode_off()
			game_manager.play_cutscene_enemy = false
			play_enemy_anim = false
			friend_leave()

	if play_collectable_anim == true:
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

		if argument == "signsquare":
			game_manager.sign_show_square = true
			game_manager.sign_show_health = false
			game_manager.sign_show_healthbar = false
			game_manager.sign_show_healthbar_empty = false
			game_manager.sign_show_1up = false
			game_manager.sign_show_lives = false
			game_manager.sign_show_none = false

		if argument == "signhealth":
			game_manager.sign_show_square = false
			game_manager.sign_show_health = true
			game_manager.sign_show_healthbar = false
			game_manager.sign_show_healthbar_empty = false
			game_manager.sign_show_1up = false
			game_manager.sign_show_lives = false
			game_manager.sign_show_none = false

		if argument == "signhealthbar":
			game_manager.sign_show_square = false
			game_manager.sign_show_health = false
			game_manager.sign_show_healthbar = true
			game_manager.sign_show_healthbar_empty = false
			game_manager.sign_show_1up = false
			game_manager.sign_show_lives = false
			game_manager.sign_show_none = false

		if argument == "signhealthbar_empty":
			game_manager.sign_show_square = false
			game_manager.sign_show_health = false
			game_manager.sign_show_healthbar = false
			game_manager.sign_show_healthbar_empty = true
			game_manager.sign_show_1up = false
			game_manager.sign_show_lives = false
			game_manager.sign_show_none = false

		if argument == "sign1up":
			game_manager.sign_show_square = false
			game_manager.sign_show_health = false
			game_manager.sign_show_healthbar = false
			game_manager.sign_show_healthbar_empty = false
			game_manager.sign_show_1up = true
			game_manager.sign_show_lives = false
			game_manager.sign_show_none = false

		if argument == "signlives":
			game_manager.sign_show_square = false
			game_manager.sign_show_health = false
			game_manager.sign_show_healthbar = false
			game_manager.sign_show_healthbar_empty = false
			game_manager.sign_show_1up = false
			game_manager.sign_show_lives = true
			game_manager.sign_show_none = false

		if argument == "signempty":
			game_manager.sign_show_square = false
			game_manager.sign_show_health = false
			game_manager.sign_show_healthbar = false
			game_manager.sign_show_healthbar_empty = false
			game_manager.sign_show_1up = false
			game_manager.sign_show_lives = false
			game_manager.sign_show_none = true

		if argument == "end_cutscene":
			game_manager.cutscenemode_off()
			game_manager.play_cutscene_collectable = false
			play_collectable_anim = false
			friend_leave()

	if play_checkpoint_anim == true:
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

		if argument == "end_cutscene":
			game_manager.cutscenemode_off()
			game_manager.play_cutscene_checkpoint = false
			play_checkpoint_anim = false
			friend_leave()

	if play_others_anim == true:
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

		if argument == "end_cutscene":
			game_manager.cutscenemode_off()
			game_manager.play_cutscene_others = false
			play_others_anim = false
			friend_leave()
		
	if play_ending_anim == true:
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

		if argument == "end_cutscene":
			game_manager.cutscenemode_off()
			game_manager.play_cutscene_ending = false
			play_ending_anim = false
			friend_leave()
