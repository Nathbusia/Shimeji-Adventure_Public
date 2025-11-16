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
		if ModeManager.is_multiplayer:
			if ModeManager.charselect_player1:
				CharactersManager.is_mod = true
			if ModeManager.charselect_player2:
				CharactersManager.is_mod_p2 = true
			if ModeManager.charselect_player3:
				CharactersManager.is_mod_p3 = true
			if ModeManager.charselect_player4:
				CharactersManager.is_mod_p4 = true
		else:
			CharactersManager.is_mod = true
		if ModeManager.charselect_player2:
			css.curCharacter_player2 = "redtestball"
			css.player_character_path = "res://mods/characters/" + css.curCharacter_player2 + "/scene/shimeji_character_playable.tscn"
		elif ModeManager.charselect_player3:
			css.curCharacter_player3 = "redtestball"
			css.player_character_path = "res://mods/characters/" + css.curCharacter_player3 + "/scene/shimeji_character_playable.tscn"
		elif ModeManager.charselect_player4:
			css.curCharacter_player4 = "redtestball"
			css.player_character_path = "res://mods/characters/" + css.curCharacter_player4 + "/scene/shimeji_character_playable.tscn"
		else:
			css.curCharacter = "redtestball"
			css.player_character_path = "res://mods/characters/" + css.curCharacter + "/scene/shimeji_character_playable.tscn"
		var ShimejiCharacter_Playable = load(css.player_character_path).instantiate()
		ShimejiCharacter_Playable.position.x = 944
		ShimejiCharacter_Playable.position.y = 307
		css.add_child(ShimejiCharacter_Playable)
		css.select_sound.play()
		if ModeManager.charselect_player1:
			ShimejiCharacter_Playable.is_player1 = true
		if ModeManager.charselect_player2:
			ShimejiCharacter_Playable.is_player2 = true
		if ModeManager.charselect_player3:
			ShimejiCharacter_Playable.is_player3 = true
		if ModeManager.charselect_player4:
			ShimejiCharacter_Playable.is_player4 = true
		CharactersManager.characterdisplay = ShimejiCharacter_Playable.charname
		css.charactername.text = ShimejiCharacter_Playable.charname
		css.windows_bg.modulate = Color(ShimejiCharacter_Playable.charcolour)
		if ModeManager.charselect_player1 == true:
			if ShimejiCharacter_Playable.charcolour == "#000000":
				css.border_p1.animation = "border_dark"
				css.player_positions_p1.animation = "player1_dark"
				css.character_icon_p1.texture = ShimejiCharacter_Playable.charIcon
			else:
				css.border_p1.modulate = Color(ShimejiCharacter_Playable.charcolour)
				css.character_icon_p1.texture = ShimejiCharacter_Playable.charIcon
		elif ModeManager.charselect_player2 == true:
			if ShimejiCharacter_Playable.charcolour == "#000000":
				css.border_p2.animation = "border_dark"
				css.player_positions_p2.animation = "player2_dark"
				css.character_icon_p2.texture = ShimejiCharacter_Playable.charIcon
			else:
				css.border_p2.modulate = Color(ShimejiCharacter_Playable.charcolour)
				css.character_icon_p2.texture = ShimejiCharacter_Playable.charIcon
		elif ModeManager.charselect_player3 == true:
			if ShimejiCharacter_Playable.charcolour == "#000000":
				css.border_p3.animation = "border_dark"
				css.player_positions_p3.animation = "player3_dark"
				css.character_icon_p3.texture = ShimejiCharacter_Playable.charIcon
			else:
				css.border_p3.modulate = Color(ShimejiCharacter_Playable.charcolour)
				css.character_icon_p3.texture = ShimejiCharacter_Playable.charIcon
		elif ModeManager.charselect_player4 == true:
			if ShimejiCharacter_Playable.charcolour == "#000000":
				css.border_p4.animation = "border_dark"
				css.player_positions_p4.animation = "player4_dark"
				css.character_icon_p4.texture = ShimejiCharacter_Playable.charIcon
			else:
				css.border_p4.modulate = Color(ShimejiCharacter_Playable.charcolour)
				css.character_icon_p4.texture = ShimejiCharacter_Playable.charIcon
		
		if ModeManager.is_multiplayer:
			if css.allplayers_selected:
				css.go_button.show()
			else:
				css.next_button.show()
		else:
			css.go_button.show()
		css.back_button.show()
		print("Current Character is now " + CharactersManager.characterdisplay + "!")
		print("Is it a Mod? (Player 1) " + str(CharactersManager.is_mod) + "!")
		print("Is it a Mod? (Player 2) " + str(CharactersManager.is_mod_p2) + "!")
		print("Is it a Mod? (Player 3) " + str(CharactersManager.is_mod_p3) + "!")
		print("Is it a Mod? (Player 4) " + str(CharactersManager.is_mod_p4) + "!")
