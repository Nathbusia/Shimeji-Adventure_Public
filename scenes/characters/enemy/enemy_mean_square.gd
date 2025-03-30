extends CharacterBody2D

var speed = -90.0
var flick = -660.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var mean_square: AnimatedSprite2D = $MeanSquare
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
var bouce = -600.0

var facing_right = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if !ground_detector.is_colliding() && is_on_floor():
		flip()
	if is_on_wall():
		flip()
	
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	
	if (body.name == "ShimejiCharacter_Playable"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			is_dead = true
			collisiondeath()
			mean_square.animation = "defeated"
			mean_animation_player.play("death")
			if body.is_fastfalling:
				enemy_step_on_hard.play()
			else:
				enemy_step_on_sound.play()
			enemy_defeated.play()
			enemy_death_timer.start()
			body.bounce()
			body.jump_count = 1
		elif (y_delta < -40):
			velocity.y = bouce
		else:
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


func death():
	is_dead = true
	collisiondeath()
	mean_square.animation = "defeated"
	mean_animation_player.play("death")
	enemy_step_on_sound.play()
	enemy_defeated.play()
	enemy_death_timer.start()
	
func _on_enemy_death_timer_timeout() -> void:
	queue_free()

func collisiondeath():
	enemy_hit_box.call_deferred("queue_free") 
	enemy_shape.call_deferred("queue_free") 
	enemy_dead_box.call_deferred("queue_free") 
