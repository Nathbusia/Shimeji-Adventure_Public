extends Node2D
@onready var dialouge_start_time: Timer = $DialougeStartTime
@onready var cutscene_laugh: AudioStreamPlayer2D = $Voices/Cutscene_Laugh
@onready var cutscene_question: AudioStreamPlayer2D = $Voices/Cutscene_Question
@onready var cutscene_battle_start: AudioStreamPlayer2D = $Voices/Cutscene_BattleStart
@onready var cutscene_chat_01: AudioStreamPlayer2D = $Voices/Cutscene_Chat01
@onready var cutscene_chat_02: AudioStreamPlayer2D = $Voices/Cutscene_Chat02
@onready var spit_vox: AudioStreamPlayer2D = $Voices/SpitVox
@onready var intro_roar_sfx: AudioStreamPlayer2D = $SFX/IntroRoarSFX
@onready var summon_sfx: AudioStreamPlayer2D = $SFX/SummonSFX
@onready var monstequare_sprite: AnimatedSprite2D = $MonstequareSprite

var endsummon : Array = [24]
var stoproaring : Array = [20]
var endspit : Array = [5]

func _ready():
	DiscordRPC.state = "In a Cutscene"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	Dialogic.signal_event.connect(DialogicSignal)

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func _on_dialouge_start_time_timeout() -> void:
	match LanguageManager.language:
		"spanish":
			run_dialogue("world1_boss_openingintro_" + LanguageManager.shortlang)
		"french":
			run_dialogue("world1_boss_openingintro_" + LanguageManager.shortlang)
		"italian":
			run_dialogue("world1_boss_openingintro_" + LanguageManager.shortlang)
		"german":
			run_dialogue("world1_boss_openingintro_" + LanguageManager.shortlang)
		"japanese":
			run_dialogue("world1_boss_openingintro_" + LanguageManager.shortlang)
		_:
			run_dialogue("world1_boss_openingintro")
	dialouge_start_time.stop()

func DialogicSignal(argument:String):
	if argument == "laughing":
		monstequare_sprite.animation = "summon"
		cutscene_laugh.play()
		summon_sfx.play()

	if argument == "talking":
		cutscene_chat_01.play()

	if argument == "talkingB":
		cutscene_chat_02.play()

	if argument == "short":
		spit_vox.play()

	if argument == "question":
		monstequare_sprite.animation = "spit"
		cutscene_question.play()

	if argument == "battlestart":
		monstequare_sprite.animation = "intro_roar"
		cutscene_battle_start.play()
		intro_roar_sfx.play()

	if argument == "beginboss":
		LoadManager.load_scene("res://scenes/levels/world1/boss_monstequare.tscn")

func _on_monstequare_sprite_frame_changed() -> void:
	if monstequare_sprite.animation == "summon":
		if monstequare_sprite.frame in endsummon:
			monstequare_sprite.animation = "idle"
	if monstequare_sprite.animation == "intro_roar":
		if monstequare_sprite.frame in stoproaring:
			monstequare_sprite.animation = "idle"
	if monstequare_sprite.animation == "spit":
		if monstequare_sprite.frame in endspit:
			monstequare_sprite.animation = "idle"
