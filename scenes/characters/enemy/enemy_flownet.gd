extends AnimatableBody2D
@onready var game_manager: GameManager = $"../../../GameManager"

func _on_trigger_hitbox_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		if game_manager.health == 1:
			game_manager.lose_health()
			game_manager.lives -= 1
			body.death()
			body.play_death_effect("death")
		else:
			if body.is_invincible == true:
				return
			else:
				game_manager.lose_health()
				body.get_hurt()
				body.hurt_invincible()
				body.play_damaged_effect("blink")

	if (body.name == "ShimejiCharacter_Playable_Player2"):
		if game_manager.health_p2 == 1:
			game_manager.lose_health_player2()
			game_manager.lives_p2 -= 1
			body.death()
			body.play_death_effect("death")
		else:
			if body.is_invincible == true:
				return
			else:
				game_manager.lose_health_player2()
				body.get_hurt()
				body.hurt_invincible()
				body.play_damaged_effect("blink")
				
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		if game_manager.health_p3 == 1:
			game_manager.lose_health_player3()
			game_manager.lives_p3 -= 1
			body.death()
			body.play_death_effect("death")
		else:
			if body.is_invincible == true:
				return
			else:
				game_manager.lose_health_player3()
				body.get_hurt()
				body.hurt_invincible()
				body.play_damaged_effect("blink")
				
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		if game_manager.health_p4 == 1:
			game_manager.lose_health_player4()
			game_manager.lives_p4 -= 1
			body.death()
			body.play_death_effect("death")
		else:
			if body.is_invincible == true:
				return
			else:
				game_manager.lose_health_player4()
				body.get_hurt()
				body.hurt_invincible()
				body.play_damaged_effect("blink")
