extends Node2D
@onready var intro_anim: AnimationPlayer = $IntroAnim
@onready var logo_bounce: AnimationPlayer = $LogoBounce
@onready var start_text: AnimationPlayer = $StartText
@onready var title_theme: AudioStreamPlayer2D = $TitleTheme

var has_pressed = false

func _ready():
	DiscordRPC.state = "In the Title Screen"
	DiscordRPC.details = ""
	DiscordRPC.refresh()

	if AltBgmManager.enabled:
		$TitleTheme.stream = load("res://bgm/menu/bgm_titlescreen_ytsafe.ogg")
		$TitleTheme.play()
	else:
		pass

	match LanguageManager.language:
		"spanish":
			$Start.text = "Pulse el botón ENTER/Inicio"
		"french":
			$Start.text = "Appuyez sur ENTRÉE/Démarrer"
		"italian":
			$Start.text = "Premere il pulsante INVIO/Avvio"
		"german":
			$Start.text = "Drücken Sie die ENTER-/Starttaste."
		"japanese":
			$GameLogo.texture = load("res://sprites/menu/title/Logo_New_Final3_JPN.png")
			$Start.text = "ENTER/スタートボタンを押します"
		_:
			return
			#It's just English

func _process(delta):
	if has_pressed:
		return
	
	if Input.is_action_pressed('start'):
		title_theme.stop()
		intro_anim.play("start")
		start_text.play("confirmed")
		logo_bounce.play("confirmed")
		has_pressed = true


func logobounce():
	logo_bounce.play("logobounce")
	start_text.play("Blink")

func tomainmenu():
	LoadManager.load_scene("res://scenes/menu/main_menu.tscn")
