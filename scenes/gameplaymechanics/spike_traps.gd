extends RigidBody2D
@onready var spike_sound: AudioStreamPlayer = $SpikeSound
@onready var game_manager: GameManager = $"../../../GameManager"

func _on_spike_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 30):
			if game_manager.health == 1:
				game_manager.lose_health()
				game_manager.lives -= 1
				body.death()
				spike_sound.play()
				body.play_death_effect("death")
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health()
					body.get_hurt()
					body.hurt_invincible()
					spike_sound.play()
					body.play_damaged_effect("blink")
		else:
			return
