extends Node

@onready var pause_panel: Panel = %PausePanel
@onready var results_panel: Panel = $ResultsPanel
@onready var bg_anim: AnimationPlayer = $ResultsPanel/ResultsBG/BGAnim
@onready var results_anim: AnimationPlayer = $ResultsPanel/ResultsText/ResultsAnim
@onready var points_apperance: AnimationPlayer = $ResultsPanel/PointsApperance
@onready var buttons_apperance: AnimationPlayer = $ResultsPanel/ButtonsApperance
@onready var triangle_counter_apperance: AnimationPlayer = $ResultsPanel/SecretUIBase/TriangleCounterApperance
@onready var game_manager: GameManager = $"../../GameManager"
@onready var score_numbers_h: AnimatedSprite2D = $ResultsPanel/Numbers/Score_NumbersH
@onready var score_numbers_t: AnimatedSprite2D = $ResultsPanel/Numbers/Score_NumbersT
@onready var score_numbers_u: AnimatedSprite2D = $ResultsPanel/Numbers/Score_NumbersU
@onready var triangle_counter_1: AnimatedSprite2D = $ResultsPanel/SecretUIBase/TriangleCounter1
@onready var triangle_counter_2: AnimatedSprite2D = $ResultsPanel/SecretUIBase/TriangleCounter2
@onready var triangle_counter_3: AnimatedSprite2D = $ResultsPanel/SecretUIBase/TriangleCounter3
@onready var triangle_counter_4: AnimatedSprite2D = $ResultsPanel/SecretUIBase/TriangleCounter4
@onready var results_show: Timer = $ResultsShow
@onready var change_level: TextureButton = $ResultsPanel/ChangeLevel
@onready var continue_button: TextureButton = $ResultsPanel/Continue
@onready var ui: CanvasLayer = $".."


var has_shown = false

var points = 0
var pointst = 0
var pointsh = 0
var secretfound = 0

func _ready() -> void:
	if ModeManager.is_story:
		change_level.hide()
	if LevelsManager.is_mod:
		continue_button.hide()

	match LanguageManager.language:
		"spanish":
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(0, load("res://sprites/ui/gameplay/results/ResultsText_SPA0001.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(1, load("res://sprites/ui/gameplay/results/ResultsText_SPA0002.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(2, load("res://sprites/ui/gameplay/results/ResultsText_SPA0003.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue0001.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue0002.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue0003.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue_Select0001.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue_Select0002.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue_Select0003.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue_Hover0001.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue_Hover0002.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Continue_Hover0003.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel0001.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel0002.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel0003.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel_Select0001.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel_Select0002.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel_Select0003.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel_Hover0001.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel_Hover0002.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_ChangeLevel_Hover0003.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit0001.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit0002.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit0003.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit_Select0001.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit_Select0002.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit_Select0003.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit_Hover0001.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit_Hover0002.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Quit_Hover0003.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay0001.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay0002.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay0003.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay_Hover0001.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay_Hover0002.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay_Hover0003.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay_Select0001.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay_Select0002.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/spa/ResultsButton_Replay_Select0003.png"))
		"french":
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(0, load("res://sprites/ui/gameplay/results/ResultsText_FRE0001.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(1, load("res://sprites/ui/gameplay/results/ResultsText_FRE0002.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(2, load("res://sprites/ui/gameplay/results/ResultsText_FRE0003.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue0001.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue0002.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue0003.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue_Select0001.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue_Select0002.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue_Select0003.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue_Hover0001.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue_Hover0002.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Continue_Hover0003.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel0001.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel0002.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel0003.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel_Select0001.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel_Select0002.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel_Select0003.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel_Hover0001.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel_Hover0002.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_ChangeLevel_Hover0003.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit0001.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit0002.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit0003.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit_Select0001.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit_Select0002.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit_Select0003.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit_Hover0001.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit_Hover0002.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Quit_Hover0003.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay0001.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay0002.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay0003.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay_Hover0001.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay_Hover0002.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay_Hover0003.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay_Select0001.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay_Select0002.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/fre/ResultsButton_Replay_Select0003.png"))
		"italian":
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(0, load("res://sprites/ui/gameplay/results/ResultsText_ITA0001.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(1, load("res://sprites/ui/gameplay/results/ResultsText_ITA0002.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(2, load("res://sprites/ui/gameplay/results/ResultsText_ITA0003.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue0001.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue0002.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue0003.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue_Select0001.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue_Select0002.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue_Select0003.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue_Hover0001.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue_Hover0002.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Continue_Hover0003.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel0001.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel0002.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel0003.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel_Select0001.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel_Select0002.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel_Select0003.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel_Hover0001.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel_Hover0002.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_ChangeLevel_Hover0003.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit0001.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit0002.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit0003.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit_Select0001.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit_Select0002.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit_Select0003.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit_Hover0001.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit_Hover0002.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Quit_Hover0003.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay0001.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay0002.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay0003.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay_Hover0001.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay_Hover0002.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay_Hover0003.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay_Select0001.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay_Select0002.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ita/ResultsButton_Replay_Select0003.png"))
		"german":
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(0, load("res://sprites/ui/gameplay/results/ResultsText_GER0001.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(1, load("res://sprites/ui/gameplay/results/ResultsText_GER0002.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(2, load("res://sprites/ui/gameplay/results/ResultsText_GER0003.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue0001.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue0002.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue0003.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue_Select0001.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue_Select0002.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue_Select0003.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue_Hover0001.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue_Hover0002.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Continue_Hover0003.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel0001.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel0002.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel0003.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel_Select0001.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel_Select0002.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel_Select0003.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel_Hover0001.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel_Hover0002.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_ChangeLevel_Hover0003.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit0001.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit0002.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit0003.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit_Select0001.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit_Select0002.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit_Select0003.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit_Hover0001.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit_Hover0002.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Quit_Hover0003.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay0001.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay0002.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay0003.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay_Hover0001.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay_Hover0002.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay_Hover0003.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay_Select0001.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay_Select0002.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/ger/ResultsButton_Replay_Select0003.png"))
		"japanese":
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(0, load("res://sprites/ui/gameplay/results/ResultsText_JPN0001.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(1, load("res://sprites/ui/gameplay/results/ResultsText_JPN0002.png"))
			$ResultsPanel/ResultsText/ResultsText.texture.set_frame_texture(2, load("res://sprites/ui/gameplay/results/ResultsText_JPN0003.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue0001.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue0002.png"))
			$ResultsPanel/Continue.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue0003.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue_Select0001.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue_Select0002.png"))
			$ResultsPanel/Continue.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue_Select0003.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue_Hover0001.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue_Hover0002.png"))
			$ResultsPanel/Continue.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Continue_Hover0003.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel0001.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel0002.png"))
			$ResultsPanel/ChangeLevel.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel0003.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel_Select0001.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel_Select0002.png"))
			$ResultsPanel/ChangeLevel.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel_Select0003.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel_Hover0001.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel_Hover0002.png"))
			$ResultsPanel/ChangeLevel.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_ChangeLevel_Hover0003.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit0001.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit0002.png"))
			$ResultsPanel/Quit.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit0003.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit_Select0001.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit_Select0002.png"))
			$ResultsPanel/Quit.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit_Select0003.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit_Hover0001.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit_Hover0002.png"))
			$ResultsPanel/Quit.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Quit_Hover0003.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay0001.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay0002.png"))
			$ResultsPanel/Replay.texture_normal.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay0003.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay_Hover0001.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay_Hover0002.png"))
			$ResultsPanel/Replay.texture_pressed.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay_Hover0003.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(0, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay_Select0001.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(1, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay_Select0002.png"))
			$ResultsPanel/Replay.texture_hover.set_frame_texture(2, load("res://sprites/ui/gameplay/results/buttons/jpn/ResultsButton_Replay_Select0003.png"))
		_:
			return
			#Always just English
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_results_panel_visibility_changed() -> void:
	if results_panel.show:
		bg_anim.play("bgpopin")
		results_anim.play("resultspopin")
		points_apperance.play("pointspopin")
		buttons_apperance.play("buttonspopin")
		triangle_counter_apperance.play("tripopin")

func add_point():
	points += 1
	if points == 1 or points == 2 or points == 3 or points == 4 or points == 5 or points == 6 or points == 7 or points == 8 or points == 9:
		score_numbers_u.play(str(points))
	if points == 10 or points == 20 or points == 30 or points == 40 or points == 50 or points == 60 or points == 70 or points == 80 or points == 90:
		pointst += 1
		score_numbers_t.play(str(pointst))
		points = 0
		score_numbers_u.play(str(points))
	if pointst == 10 or pointst == 20 or pointst == 30 or pointst == 40 or pointst == 50 or pointst == 60 or pointst == 70 or pointst == 80 or pointst == 90:
		pointsh += 1
		score_numbers_h.play(str(pointsh))
		pointst = 0
		score_numbers_t.play(str(pointst))
		points = 0
		score_numbers_u.play(str(points))

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

func _on_replay_pressed() -> void:
	results_panel.hide()
	get_tree().reload_current_scene()



func _on_continue_pressed() -> void:
	if ModeManager.is_story:
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
		if LevelsManager.levelname == "boss_monstequare":
			LoadManager.load_scene("res://scenes/cutscenes/world1/world1_ending.tscn")
		elif LevelsManager.levelname == "boss_pete":
			LoadManager.load_scene("res://scenes/cutscenes/world2/world2_ending.tscn")
		else:
			ModeManager.isin_worldmap = true
			LoadManager.load_scene("res://scenes/worldmap/worldmap_"+ SaveFileManager.currentworld +".tscn")
		results_panel.hide()
		ui.hide()
	else:
		match LevelsManager.levelname:
			"testlevel1":
				LoadManager.load_scene("res://scenes/levels/testlevel/testlevel2.tscn")
				LevelsManager.levelname = "testlevel2"
				LevelsManager.is_bossbattle = false
			"testlevel2":
				LoadManager.load_scene("res://scenes/demoend/demo_end_testworld.tscn")
			"tutorial":
				LoadManager.load_scene("res://scenes/levels/world1/level1.tscn")
				LevelsManager.levelname = "level1"
				LevelsManager.is_bossbattle = false
			"level1":
				LoadManager.load_scene("res://scenes/levels/world1/level2.tscn")
				LevelsManager.levelname = "level2"
				LevelsManager.is_bossbattle = false
			"level2":
				LoadManager.load_scene("res://scenes/levels/world1/boss_monstequare.tscn")
				LevelsManager.levelname = "boss_monstequare"
				LevelsManager.is_bossbattle = true
			"world2_level1":
				LoadManager.load_scene("res://scenes/levels/world2/world2_level2.tscn")
				LevelsManager.levelname = "world2_level2"
				LevelsManager.is_bossbattle = false
			"world2_level2":
				LoadManager.load_scene("res://scenes/levels/world2/world2_level3.tscn")
				LevelsManager.levelname = "world2_level3"
				LevelsManager.is_bossbattle = false
			"world2_level3":
				LoadManager.load_scene("res://scenes/levels/world2/boss_pete.tscn")
				LevelsManager.levelname = "boss_pete"
				LevelsManager.is_bossbattle = true
			"boss_monstequare":
				LoadManager.load_scene("res://scenes/demoend/demo_end.tscn")
			"boss_pete":
				LoadManager.load_scene("res://scenes/demoend/demo_end.tscn")
		results_panel.hide()
		ui.hide()



func _on_change_level_pressed() -> void:
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
	results_panel.hide()
	ui.hide()


func _on_quit_pressed() -> void:
	if ModeManager.is_story:
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
		ModeManager.is_savefile2 = false
		ModeManager.is_savefile3 = false
		ModeManager.in_gameplay = false
		results_panel.hide()
		ModeManager.isin_worldmap = false
		LoadManager.load_scene("res://scenes/menu/story_save_file_select.tscn")
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
		LoadManager.load_scene("res://scenes/menu/main_menu.tscn")
		results_panel.hide()
		ui.hide()
