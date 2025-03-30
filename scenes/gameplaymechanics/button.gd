extends RigidBody2D
@onready var button_pressed_on: AudioStreamPlayer = $ButtonPressedOn
@onready var button_pressed_off: AudioStreamPlayer = $ButtonPressedOff
@onready var button_sprite: AnimatedSprite2D = $ButtonSprite

var pressed = false


func _on_button_trigger_area_entered(_area: Area2D) -> void:
	pressed = true
	button_pressed_on.play()
	button_sprite.animation = "press"


func _on_button_trigger_area_exited(_area: Area2D) -> void:
	pressed = false
	button_pressed_off.play()
	button_sprite.animation = "default"


func _on_button_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") or (body.name == "ThrowableObject2"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			pressed = true
			button_pressed_on.play()
			button_sprite.animation = "press"
		else:
			return


func _on_button_trigger_body_exited(_body: Node2D) -> void:
	pressed = false
	button_pressed_off.play()
	button_sprite.animation = "default"
