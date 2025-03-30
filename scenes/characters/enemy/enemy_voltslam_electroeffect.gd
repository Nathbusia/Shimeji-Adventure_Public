extends CharacterBody2D

var speed = -92.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var electro_effect: AnimatedSprite2D = $ElectroEffect
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var enemy_death_timer: Timer = $EnemyDeathTimer
@onready var mean_animation_player: AnimationPlayer = $Mean_AnimationPlayer
@onready var enemy_shape: CollisionShape2D = $EnemyShape
@onready var enemy_hit_box: CollisionShape2D = $Area2D/EnemyHitBox
@onready var enemy_dead_box: CollisionShape2D = $Area2D/EnemyDeadBox
@onready var enemy_step_on_sound: AudioStreamPlayer = $EnemyStepOnSound
@onready var enemy_defeated: AudioStreamPlayer = $EnemyDefeated
@onready var enemy_step_on_hard: AudioStreamPlayer = $EnemyStepOnHard
@onready var ground_detector: RayCast2D = $GroundDetector
@onready var wall_detector: RayCast2D = $WallDetector

var is_dead = false

var facing_right = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	if facing_right:
		speed = abs(speed)
		electro_effect.flip_h = true
	else:
		speed = abs(speed) * -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		if game_manager.health == 1:
			game_manager.lose_health()
			game_manager.lives -= 1
			body.death()
			body.play_death_effect("death")
		else:
			if body.is_invincible == true:
				return
			else:
				game_manager.lose_health()
				body.get_hurt()
				body.hurt_invincible()
				body.play_damaged_effect("blink")


func _on_enemy_death_timer_timeout() -> void:
	queue_free()
