extends Area2D
@onready var clear: Node = $"../../UI/Clear"
@onready var game_manager: GameManager = $"../../GameManager"


var is_collected = false

func _on_body_entered(body: Node2D) -> void:
	if is_collected:
		return #So you won't collect it again.
	else:
		if (body.name == "ShimejiCharacter_Playable"):
			clear.level_cleared()
			body.levelcompleted()
			game_manager.startouched = true
