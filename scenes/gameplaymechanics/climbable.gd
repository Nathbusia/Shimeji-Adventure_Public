extends Area2D
@onready var shimeji_character_playable: CharacterBody2D = $"../ShimejiCharacter_Playable"

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && not shimeji_character_playable.is_fastfalling:
		body.is_climbing = true
		body.jump_count = 0
		body.can_jump = true
		body.grab_wall_sound.play()
		body.velocity.x = 0


func _on_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && not shimeji_character_playable.is_fastfalling:
		body.is_climbing = false
