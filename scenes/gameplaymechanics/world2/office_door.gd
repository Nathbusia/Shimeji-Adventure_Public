extends RigidBody2D
@onready var lifetime: Timer = $Lifetime
@onready var door_open_sound: AudioStreamPlayer2D = $DoorOpenSound

var functioned = false
var sound_played = true

const SCROLL_VELOCITY = 600.0

func _process(delta: float) -> void:
	if functioned:
		linear_velocity = Vector2(0, -SCROLL_VELOCITY) 
		lifetime.start()
		if sound_played:
			door_open_sound.play()
			sound_played = false
	else:
		linear_velocity = Vector2(0, SCROLL_VELOCITY) 


func _on_lifetime_timeout() -> void:
	queue_free()
