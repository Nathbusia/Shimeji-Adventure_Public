extends Area2D
@onready var game_manager: GameManager = $"../../GameManager"

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		game_manager.onehit_death()
		body.death()
		body.play_death_effect("death")
		if body.is_fastfalling:
			body.shime_animation_player_slam_dash.stop()
