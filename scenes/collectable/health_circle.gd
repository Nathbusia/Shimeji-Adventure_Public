extends Area2D
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var health_sfx: AudioStreamPlayer = $HealthSFX
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var health_full_sfx: AudioStreamPlayer = $HealthFullSFX

var collected = false

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		if collected:
			return
		elif game_manager.health == 5:
			health_full_sfx.play()
			animation_player.play("alreadyfull")
		else:
			health_sfx.play()
			animation_player.play("collect")
			collected = true
			game_manager.add_health()

func _healthends():
	queue_free()
