extends Panel

signal slot_selected

@onready var lss: LevelSelect

func _ready():
	lss = get_node("/root/LevelSelect")

func _on_slot_button_pressed() -> void:
	lss.select.play()
	lss.curLevel = "templatelevel" #Place level's filename
	lss.level_path = "res://mods/levels-bosses/templatelevel/scene/levelselect/templatelevel.tscn" #Place the level's info directory from "levelselect" folder here.
	var level = load(lss.level_path).instantiate()
	LevelsManager.is_bossbattle = false #Check if your level is a boss or a normal level.
	LevelsManager.is_mod = true #Always leave this true. It's the only way the level will load.
	add_child(level)
	lss.level_thumbnail.texture = level.levelthumb
	lss.level_name.text = level.levelname
	lss.level_creator.text = level.levelcreator
	lss.level_description.text = level.leveldesc
	print("Current Level is now " + lss.curLevel + "!")
	lss.go_button.show()
