extends Control

@export var bg_color : Color = Color.BLACK
@export var to_scene : PackedScene = null
@export var title_color := Color.AQUA
@export var text_color := Color.WHITE
@export var title_font : FontFile = null
@export var text_font : FontFile = null
@export var Music : AudioStream = null
@export var Use_Video_Audio : bool = false
@export var Video : VideoStream = null
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select

const section_time := 2.0
const line_time := 0.6
const base_speed := 70
const speed_up_multiplier := 10.0

var scroll_speed : float = base_speed
var speed_up := false

@onready var colorrect := $ColorRect
@onready var videoplayer := $VideoPlayer
@onready var line := $CreditsContainer/Line
var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"Shimeji Adventure",
		"A game by FlameOut56"
	],[
		"Shimeji Desktop Pet",
		"By Yuki Yamada"
	],[
		"Music Credits",
		"APMMusic - Main Source of Music",
		"Ded Good Music",
		"Sonoton Recorded Music Library",
		"Juice Music"
	],[
		"Sound Effects Sources",
		"Cymatics - Video Game Vol. 1",
		"Boom Library - Casual UI",
		"Epic Stock Media - Hybrid Game",
		"WarioWare: Move It/Smooth Moves - Nintendo/Intelligent Systems",
		"LittleBigPlanet - Media Molecule/PlayStation",
		"DOVA-SYNDROME (Only for the Disclaimer pop-in SFX)",
		"ROBLOX (Only for the button sounds)",
		"Sonic Generations (Only for the button sounds)",
		"ToonTown Online (for the Slam Dash and Spring SFX)"
	],[
		"Plug-ins",
		"Dialogic Team",
		"AG-Credits - MiDe-S (For this credits roll)"
	],[
		"Shout Out (Tutorials that I used from these lads)",
		"Coco Code",
		"Kaan Alpar",
		"GameDevKnight",
		"Cashew OldDew",
		"DevWorm",
		"DashNothing",
		"Game Endeavor",
		"Chris Tutorials",
		"Jean Makes Games"
	],[
		"Special Thanks",
		"Gamingmints (For finalizing the logo design)",
		"Escape Studios (This game debut as an Uni project)",
		"Friends, Family, So on...",
		"YOU! for playing this game."
	]
]

func _ready():
	DiscordRPC.state = "Viewing the Credits"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	
	colorrect.color = bg_color
	videoplayer.set_stream(Video)
	if !Use_Video_Audio:
		var stream = AudioStreamPlayer.new()
		stream.set_stream(Music)
		add_child(stream)
		videoplayer.set_volume_db(-80)
		stream.play()
	else:
		videoplayer.set_volume_db(0)
	videoplayer.play()
	

func _process(delta):
	scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.set_global_position(l.get_global_position() - Vector2(0, scroll_speed))
			if l.get_global_position().y < l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		LoadManager.load_scene("res://scenes/menu/settings.tscn")


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		if title_font != null:
			new_line.set("theme_override_fonts/font", title_font)
		new_line.set("theme_override_colors/font_color", title_color)
	
	else:
		if text_font != null:
			new_line.set("theme_override_fonts/font", text_font)
		new_line.set("theme_override_colors/font_color", text_color)
	
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		finish()
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false


func _on_back_button_pressed() -> void:
	select.play()
	LoadManager.load_scene("res://scenes/menu/settings.tscn")
	
