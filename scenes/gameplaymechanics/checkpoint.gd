extends Area2D
class_name Checkpoint

@onready var check_anim: AnimationPlayer = $CheckAnim
@onready var check_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: GameManager = $"../../../GameManager"

@export var spawnpoint = false

var activated = false

func activate():
	game_manager.current_checkpoint = self
	activated = true
	check_sprite.play("active")
	check_anim.play("active")

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && !activated:
		activate()
