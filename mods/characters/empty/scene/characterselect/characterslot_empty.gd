extends Panel

signal slot_selected

@onready var slot_button: TextureButton = $CharSelect_BG/CharSelect_Char/CharSelect_FG/SlotButton

@onready var css: CharacterSelect

func _ready():
	css = get_node("/root/CharacterSelect")

func _on_slot_button_pressed() -> void:
	if css.characterselected:
		return
	else:
		css.characterselected = true
		css.ground_shape.disabled = false
		css.wall_shape_l.disabled = false
		css.wall_shape_r.disabled = false
		CharactersManager.is_mod = true
		css.curCharacter = "empty"
		css.player_character_path = "res://mods/characters/" + css.curCharacter + "/scene/shimeji_character_playable.tscn"
		var ShimejiCharacter_Playable = load(css.player_character_path).instantiate()
		ShimejiCharacter_Playable.position.x = 944
		ShimejiCharacter_Playable.position.y = 307
		css.add_child(ShimejiCharacter_Playable)
		css.select_sound.play()
		css.charactername.text = ShimejiCharacter_Playable.charname
		css.windows_bg.modulate = Color(ShimejiCharacter_Playable.charcolour)
		css.go_button.show()
		css.back_button.show()
		print("Current Character is now " + css.curCharacter + "!")
