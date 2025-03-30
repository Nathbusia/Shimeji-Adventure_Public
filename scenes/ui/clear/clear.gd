extends Node

@onready var clear_panel: Panel = %ClearPanel
@onready var clear_bg_anim: AnimationPlayer = $ClearPanel/ClearBG/ClearBG_Anim
@onready var clear_text_anim: AnimationPlayer = $ClearPanel/ClearBG/LevelClear_Text/ClearText_Anim
@onready var results_panel: Panel = $"../Results/ResultsPanel"
@onready var results: Node = $"../Results"
@onready var pause: Node = $"../Pause"
@onready var clear_sfx: AudioStreamPlayer = $ClearSFX
@onready var boss_clear_bgm: AudioStreamPlayer = $BossClearBGM

func openresults():
	clear_panel.hide()
	results_panel.show()


func level_cleared():
	clear_panel.show()
	clear_bg_anim.play("cleardrop")
	clear_text_anim.play("textdrop")
	clear_sfx.play()
	if LevelsManager.is_bossbattle:
		boss_clear_bgm.play()
	pause.levelcomplete()
