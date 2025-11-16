extends Node

@onready var pause_panel: Panel = %PausePanel
@onready var level_bgm: AudioStreamPlayer = $"../../SceneObjects/Level_BGM"
@onready var pause_sound: AudioStreamPlayer = $PausePanel/PauseSound
@onready var game_manager: GameManager = $"../../GameManager"
@onready var triangle_counter_1: AnimatedSprite2D = $PausePanel/SecretUIPause/TriangleCounter1
@onready var triangle_counter_2: AnimatedSprite2D = $PausePanel/SecretUIPause/TriangleCounter2
@onready var triangle_counter_3: AnimatedSprite2D = $PausePanel/SecretUIPause/TriangleCounter3
@onready var triangle_counter_4: AnimatedSprite2D = $PausePanel/SecretUIPause/TriangleCounter4

@onready var ui: CanvasLayer = $".."

@onready var Settings: Control

var secretfound = 0
var level_complete = false

func _ready() -> void:
	match LanguageManager.language:
		"spanish":
			$PausePanel/Resume.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume0001.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume0002.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume0003.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume_Hover0001.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume_Hover0002.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume_Hover0003.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume_Select0001.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume_Select0002.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/spa/PauseButton_Resume_Select0003.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart0001.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart0002.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart0003.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart_Hover0001.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart_Hover0002.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart_Hover0003.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart_Select0001.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart_Select0002.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/spa/PauseButton_Restart_Select0003.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings0001.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings0002.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings0003.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings_Hover0001.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings_Hover0002.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings_Hover0003.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings_Select0001.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings_Select0002.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/spa/PauseButton_Settings_Select0003.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit0001.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit0002.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit0003.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit_Hover0001.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit_Hover0002.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit_Hover0003.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit_Select0001.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit_Select0002.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/spa/PauseButton_Quit_Select0003.png"))
		"french":
			$PausePanel/Resume.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume0001.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume0002.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume0003.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume_Hover0001.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume_Hover0002.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume_Hover0003.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume_Select0001.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume_Select0002.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/fre/PauseButton_Resume_Select0003.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart0001.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart0002.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart0003.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart_Hover0001.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart_Hover0002.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart_Hover0003.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart_Select0001.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart_Select0002.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/fre/PauseButton_Restart_Select0003.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings0001.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings0002.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings0003.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings_Hover0001.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings_Hover0002.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings_Hover0003.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings_Select0001.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings_Select0002.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/fre/PauseButton_Settings_Select0003.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit0001.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit0002.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit0003.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit_Hover0001.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit_Hover0002.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit_Hover0003.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit_Select0001.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit_Select0002.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/fre/PauseButton_Quit_Select0003.png"))
		"italian":
			$PausePanel/Resume.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume0001.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume0002.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume0003.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume_Hover0001.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume_Hover0002.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume_Hover0003.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume_Select0001.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume_Select0002.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/ita/PauseButton_Resume_Select0003.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart0001.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart0002.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart0003.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart_Hover0001.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart_Hover0002.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart_Hover0003.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart_Select0001.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart_Select0002.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/ita/PauseButton_Restart_Select0003.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings0001.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings0002.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings0003.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings_Hover0001.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings_Hover0002.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings_Hover0003.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings_Select0001.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings_Select0002.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/ita/PauseButton_Settings_Select0003.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit0001.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit0002.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit0003.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit_Hover0001.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit_Hover0002.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit_Hover0003.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit_Select0001.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit_Select0002.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/ita/PauseButton_Quit_Select0003.png"))
		"german":
			$PausePanel/Resume.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume0001.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume0002.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume0003.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume_Hover0001.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume_Hover0002.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume_Hover0003.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume_Select0001.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume_Select0002.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/ger/PauseButton_Resume_Select0003.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart0001.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart0002.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart0003.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart_Hover0001.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart_Hover0002.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart_Hover0003.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart_Select0001.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart_Select0002.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/ger/PauseButton_Restart_Select0003.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings0001.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings0002.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings0003.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings_Hover0001.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings_Hover0002.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings_Hover0003.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings_Select0001.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings_Select0002.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/ger/PauseButton_Settings_Select0003.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit0001.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit0002.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit0003.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit_Hover0001.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit_Hover0002.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit_Hover0003.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit_Select0001.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit_Select0002.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/ger/PauseButton_Quit_Select0003.png"))
		"japanese":
			$PausePanel/Resume.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume0001.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume0002.png"))
			$PausePanel/Resume.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume0003.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume_Hover0001.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume_Hover0002.png"))
			$PausePanel/Resume.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume_Hover0003.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume_Select0001.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume_Select0002.png"))
			$PausePanel/Resume.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/resume/jpn/PauseButton_Resume_Select0003.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart0001.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart0002.png"))
			$PausePanel/Restart.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart0003.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart_Hover0001.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart_Hover0002.png"))
			$PausePanel/Restart.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart_Hover0003.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart_Select0001.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart_Select0002.png"))
			$PausePanel/Restart.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/restart/jpn/PauseButton_Restart_Select0003.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings0001.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings0002.png"))
			$PausePanel/Settings.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings0003.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings_Hover0001.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings_Hover0002.png"))
			$PausePanel/Settings.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings_Hover0003.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings_Select0001.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings_Select0002.png"))
			$PausePanel/Settings.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/settings/jpn/PauseButton_Settings_Select0003.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit0001.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit0002.png"))
			$PausePanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit0003.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit_Hover0001.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit_Hover0002.png"))
			$PausePanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit_Hover0003.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit_Select0001.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit_Select0002.png"))
			$PausePanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/pause/buttons/quit/jpn/PauseButton_Quit_Select0003.png"))
		_:
			return
			#Just English

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("pause")
	if level_complete:
		return #You won't be able to paused after completing a level.
	else:
		if (esc_pressed == true && !game_manager.is_incutscene):
			get_tree().paused = true
			pause_sound.play()
			pause_panel.show()


func _on_resume_pressed() -> void:
	pause_panel.hide()
	get_tree().paused = false


func _on_restart_pressed() -> void:
	pause_panel.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()

func levelcomplete():
	level_complete = true

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

func _on_quit_pressed() -> void:
	pause_panel.hide()
	ui.hide()
	if ModeManager.is_story:
		if ModeManager.isin_worldmap:
			if ModeManager.is_savefile1:
				SaveFileManager.update_data(
				SaveFileManager.currentworld, 
				SaveFileManager.currentplayerlives,
				SaveFileManager.currentplayerlivest,
				SaveFileManager.maxcurrentlives,
				SaveFileManager.trianglestotal,
				SaveFileManager.trianglestotalt,
				SaveFileManager.trianglestotalh,
				SaveFileManager.maxtrianglestotal)
				
				SaveFileManager.currentworld = LevelsManager.worldname
				SaveFileManager.currentplayerlives = SaveFileManager.data_dic["currentlives"]
				SaveFileManager.currentplayerlivest = SaveFileManager.data_dic["currentlivest"]
				SaveFileManager.maxcurrentlives = SaveFileManager.data_dic["maxlives"]
				SaveFileManager.trianglestotal = SaveFileManager.data_dic["trianglestotal"]
				SaveFileManager.trianglestotalt = SaveFileManager.data_dic["trianglestotalt"]
				SaveFileManager.trianglestotalh = SaveFileManager.data_dic["trianglestotalh"]
				SaveFileManager.maxtrianglestotal = SaveFileManager.data_dic["maxtriangles"]
				
				SaveFileManager.update_w1_tut(
				SaveFileManager.world1_tutorial_dic["trianglecollected1"], 
				SaveFileManager.world1_tutorial_dic["trianglecollected2"], 
				SaveFileManager.world1_tutorial_dic["trianglecollected3"],
				SaveFileManager.world1_tutorial_dic["trianglecollected4"],
				SaveFileManager.world1_tutorial_dic["hasbeencompleted"])

				SaveFileManager.update_w1_lv1(
				SaveFileManager.world1_level1_dic["unlocked"],
				SaveFileManager.world1_level1_dic["trianglecollected1"], 
				SaveFileManager.world1_level1_dic["trianglecollected2"], 
				SaveFileManager.world1_level1_dic["trianglecollected3"],
				SaveFileManager.world1_level1_dic["trianglecollected4"],
				SaveFileManager.world1_level1_dic["hasbeencompleted"])

				SaveFileManager.update_w1_lv2(
				SaveFileManager.world1_level2_dic["unlocked"],
				SaveFileManager.world1_level2_dic["trianglecollected1"], 
				SaveFileManager.world1_level2_dic["trianglecollected2"], 
				SaveFileManager.world1_level2_dic["trianglecollected3"],
				SaveFileManager.world1_level2_dic["trianglecollected4"],
				SaveFileManager.world1_level2_dic["hasbeencompleted"])

				SaveFileManager.update_w1_boss(
				SaveFileManager.world1_boss_dic["unlocked"],
				SaveFileManager.world1_boss_dic["hasbeencompleted"])

			SaveFileManager.update_w2_lv1(
				SaveFileManager.world2_level1_dic["trianglecollected1"], 
				SaveFileManager.world2_level1_dic["trianglecollected2"], 
				SaveFileManager.world2_level1_dic["trianglecollected3"],
				SaveFileManager.world2_level1_dic["trianglecollected4"],
				SaveFileManager.world2_level1_dic["hasbeencompleted"])

			SaveFileManager.update_w2_lv2(
				SaveFileManager.world2_level2_dic["unlocked"],
				SaveFileManager.world2_level2_dic["trianglecollected1"], 
				SaveFileManager.world2_level2_dic["trianglecollected2"], 
				SaveFileManager.world2_level2_dic["trianglecollected3"],
				SaveFileManager.world2_level2_dic["trianglecollected4"],
				SaveFileManager.world2_level2_dic["hasbeencompleted"])

			SaveFileManager.update_w2_lv3(
				SaveFileManager.world2_level3_dic["unlocked"],
				SaveFileManager.world2_level3_dic["trianglecollected1"], 
				SaveFileManager.world2_level3_dic["trianglecollected2"], 
				SaveFileManager.world2_level3_dic["trianglecollected3"],
				SaveFileManager.world2_level3_dic["trianglecollected4"],
				SaveFileManager.world2_level3_dic["hasbeencompleted"])

			SaveFileManager.update_w2_boss(
				SaveFileManager.world2_boss_dic["unlocked"],
				SaveFileManager.world2_boss_dic["hasbeencompleted"])
			
			SaveFileManager.update_world_unlocks_dic(
				SaveFileManager.world_unlocks_dic["world2unlocked"],
				SaveFileManager.world_unlocks_dic["recentlyunlocked_world2"],
				SaveFileManager.world_unlocks_dic["world3unlocked"],
				SaveFileManager.world_unlocks_dic["world4unlocked"],
				SaveFileManager.world_unlocks_dic["world5unlocked"],
				SaveFileManager.world_unlocks_dic["world6unlocked"],
				SaveFileManager.world_unlocks_dic["world7unlocked"],
				SaveFileManager.world_unlocks_dic["world8unlocked"])

			SaveGame.save_game()
			ModeManager.is_savefile1 = false
			ModeManager.in_gameplay = false
			ModeManager.isin_worldmap = false
			LoadManager.load_scene("res://scenes/menu/story_save_file_select.tscn")
		else:
			SaveGame.save_game()
			ModeManager.isin_worldmap = true
			LoadManager.load_scene("res://scenes/worldmap/worldmap_"+ SaveFileManager.currentworld +".tscn")
	else:
		if ModeManager.is_multiplayer:
			ModeManager.is_multiplayer = false
			ModeManager.multi_2players = false
			ModeManager.multi_3players = false
			ModeManager.multi_4players = false
			if CharactersManager.is_mod:
				game_manager.ShimejiCharacter_PlayableMod.is_player1 = false
			else:
				game_manager.ShimejiCharacter_Playable.is_player1 = false
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p2:
					game_manager.ShimejiCharacter_PlayableMod_p2.is_player2 = false
				else:
					game_manager.ShimejiCharacter_Playable_p2.is_player2 = false
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					game_manager.ShimejiCharacter_PlayableMod_p3.is_player3 = false
				else:
					game_manager.ShimejiCharacter_Playable_p3.is_player3 = false
			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					game_manager.ShimejiCharacter_PlayableMod_p4.is_player4 = false
				else:
					game_manager.ShimejiCharacter_Playable_p4.is_player4 = false
		LevelsManager.is_mod = false
		ModeManager.in_gameplay = false
		LoadManager.load_scene("res://scenes/menu/level_select.tscn")

func _on_settings_pressed() -> void:
	var scene =  get_node("/root/Node/UI")
	Settings = load("res://scenes/menu/settings.tscn").instantiate()
	scene.add_child(Settings)
	
