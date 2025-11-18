extends Area2D
@onready var game_manager: GameManager = $"../../GameManager"

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		game_manager.onehit_death()
		body.death()
		body.play_death_effect("death")
		body.stand_shape.disabled = true
		if body.is_fastfalling:
			body.shime_animation_player_slam_dash.stop()
			body.slam_dash_shape.disabled = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		game_manager.onehit_death_player2()
		body.death()
		body.play_death_effect("death")
		body.stand_shape.disabled = true
		if body.is_fastfalling:
			body.shime_animation_player_slam_dash.stop()
			body.slam_dash_shape.disabled = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		game_manager.onehit_death_player3()
		body.death()
		body.play_death_effect("death")
		body.stand_shape.disabled = true
		if body.is_fastfalling:
			body.shime_animation_player_slam_dash.stop()
			body.slam_dash_shape.disabled = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		game_manager.onehit_death_player4()
		body.death()
		body.play_death_effect("death")
		body.stand_shape.disabled = true
		if body.is_fastfalling:
			body.shime_animation_player_slam_dash.stop()
			body.slam_dash_shape.disabled = true
