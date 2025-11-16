extends Area2D
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var triangle_rays: Sprite2D = $TriangleRays
@onready var triangle: AnimatedSprite2D = $Triangle
@onready var ray_anim_spin: AnimationPlayer = $RayAnimSpin
@onready var ray_anim_collected: AnimationPlayer = $RayAnimCollected
@onready var triangle_collected: AnimationPlayer = $TriangleCollected
@onready var results: Node = $"../../../UI/Results"
@onready var animation_player: AnimationPlayer = $"../../../UI/GUI/SecretUIBase/AnimationPlayer"
@onready var got_sfx: AudioStreamPlayer = $GotSFX
@onready var pause: Node = $"../../../UI/Pause"

var already_collected = true


var is_collected = false


func _on_body_entered(body: Node2D) -> void:
	if is_collected:
		return
	else:
		if (body.name == "ShimejiCharacter_Playable") || (body.name == "ShimejiCharacter_Playable_Player2") || (body.name == "ShimejiCharacter_Playable_Player3") || (body.name == "ShimejiCharacter_Playable_Player4") && not is_collected:
			animation_player.play("popin_out")
			triangle_collected.play("collect")
			ray_anim_collected.play("collect")
			got_sfx.play()
			is_collected = true

func anim_end():
	is_collected = false
	queue_free()
