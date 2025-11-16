extends Area2D
@onready var speech_option: AnimationPlayer = $SpeechOption

var is_in_zone = false

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		speech_option.play("popin")
		is_in_zone = true


func _on_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		speech_option.play("popout")
		is_in_zone = false
