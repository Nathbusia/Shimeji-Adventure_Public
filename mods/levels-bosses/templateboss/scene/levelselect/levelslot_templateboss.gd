extends Panel

signal slot_selected

@onready var lss: LevelSelect

func _ready():
	lss = get_node("/root/LevelSelect")

func _on_slot_button_pressed() -> void:
	lss.select.play()
	lss.curLevel = "templateboss" #Place level's filename
	lss.level_path = "res://mods/levels-bosses/templateboss/scene/levelselect/templateboss.tscn" #Place the level's info directory from "levelselect" folder here.
	var level = load(lss.level_path).instantiate()
	LevelsManager.is_bossbattle = true #Check if your level is a boss or a normal level.
	LevelsManager.is_mod = true #Always leave this true. It's the only way the level will load.
	add_child(level)
	lss.level_thumbnail.texture = level.levelthumb
	LevelsManager.leveldisplay = level.levelname
	if level.multilingual: #This will check if your level's Multilingual boot was set to true.
		match LanguageManager.language:
			"spanish":
				lss.level_name.text = level.levelname_spa
				lss.level_description.text = level.leveldesc_spa
			"french":
				lss.level_name.text = level.levelname_fre
				lss.level_description.text = level.leveldesc_fre
			"italian":
				lss.level_name.text = level.levelname_ita
				lss.level_description.text = level.leveldesc_ita
			"german":
				lss.level_name.text = level.levelname_ger
				lss.level_description.text = level.leveldesc_ger
			"japanese":
				lss.level_name.text = level.levelname_jpn
				lss.level_description.text = level.leveldesc_jpn
			_: #English/Other Languages
				lss.level_name.text = level.levelname
				lss.level_description.text = level.leveldesc
	else:
		lss.level_name.text = level.levelname
		lss.level_description.text = level.leveldesc
	lss.level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	lss.go_button.show()
