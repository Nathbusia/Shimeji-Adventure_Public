extends Area2D
@onready var clear: Node = $"../../UI/Clear"
@onready var game_manager: GameManager = $"../../GameManager"


var is_collected = false

func _on_body_entered(body: Node2D) -> void:
	if is_collected:
		return #So you won't collect it again.
	else:
		if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player4") || (body.name == "ShimejiCharacter_Playable"):
			clear.level_cleared()
			body.levelcompleted()
			if ModeManager.is_multiplayer:
				if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
					if CharactersManager.is_mod:
						game_manager.ShimejiCharacter_PlayableMod.levelcompleted()
					else:
						game_manager.ShimejiCharacter_Playable.levelcompleted()
					if CharactersManager.is_mod_p2:
						game_manager.ShimejiCharacter_PlayableMod_p2.levelcompleted()
					else:
						game_manager.ShimejiCharacter_Playable_p2.levelcompleted()
				if ModeManager.multi_3players || ModeManager.multi_4players:
					if CharactersManager.is_mod_p3:
						game_manager.ShimejiCharacter_PlayableMod_p3.levelcompleted()
					else:
						game_manager.ShimejiCharacter_Playable_p3.levelcompleted()
				if ModeManager.multi_4players:
					if CharactersManager.is_mod_p4:
						game_manager.ShimejiCharacter_PlayableMod_p4.levelcompleted()
					else:
						game_manager.ShimejiCharacter_Playable_p4.levelcompleted()
			game_manager.startouched = true
