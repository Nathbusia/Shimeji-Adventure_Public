extends Area2D
@onready var funnysquare: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var timer: Timer = $Timer
@onready var square_collect: AudioStreamPlayer = $SquareCollect
@onready var results: Node = %Results

var is_collected = false

func _on_body_entered(body: Node2D) -> void:
	if is_collected:
		return #So you won't collect it again.
	else:
		if (body.name == "ShimejiCharacter_Playable"):
			funnysquare.animation = "collected"
			square_collect.play()
			game_manager.add_point()
			results.add_point()
			is_collected = true
			timer.start()
		else:
			return #So that no other enemies or objects can collect points other than the player itself.


func _on_timer_timeout() -> void:
	is_collected = false
	queue_free()
