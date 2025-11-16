extends Area2D
class_name Checkpoint

@onready var check_anim: AnimationPlayer = $CheckAnim
@onready var check_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: GameManager = $"../../../GameManager"

@export var spawnpoint = false

var activated = false

func activate():
	game_manager.current_checkpoint = self
	game_manager.current_checkpoint_p2 = self
	game_manager.current_checkpoint_p3 = self
	game_manager.current_checkpoint_p4 = self
	activated = true
	check_sprite.play("active")
	check_anim.play("active")

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && !activated:
		activate()
	if (body.name == "ShimejiCharacter_Playable_Player2") && !activated:
		activate()
	if (body.name == "ShimejiCharacter_Playable_Player3") && !activated:
		activate()
	if (body.name == "ShimejiCharacter_Playable_Player4") && !activated:
		activate()
