extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		body.queue_free()
