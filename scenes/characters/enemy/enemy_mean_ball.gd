extends RigidBody2D
@onready var mean_ball: AnimatedSprite2D = $MeanBall
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var enemy_death_timer: Timer = $EnemyDeathTimer
@onready var mean_animation_player: AnimationPlayer = $Mean_AnimationPlayer
@onready var enemy_shape: CollisionShape2D = $EnemyShape
@onready var enemy_hit_box: CollisionShape2D = $Area2D/EnemyHitBox
@onready var enemy_dead_box: CollisionShape2D = $Area2D/EnemyDeadBox
@onready var enemy_step_on_sound: AudioStreamPlayer = $EnemyStepOnSound
@onready var enemy_defeated: AudioStreamPlayer = $EnemyDefeated
@onready var enemy_step_on_hard: AudioStreamPlayer = $EnemyStepOnHard

var bouce = -600.0

var is_dead = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	
	if (body.name == "ShimejiCharacter_Playable"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			is_dead = true
			collisiondeath()
			mean_ball.animation = "defeat"
			mean_animation_player.play("death")
			if body.is_fastfalling:
				enemy_step_on_hard.play()
			else:
				enemy_step_on_sound.play()
			enemy_defeated.play()
			enemy_death_timer.start()
			body.bounce()
			body.jump_count = 1
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


func _on_enemy_death_timer_timeout() -> void:
	queue_free()

func death():
	is_dead = true
	collisiondeath()
	mean_ball.animation = "defeat"
	mean_animation_player.play("death")
	enemy_step_on_sound.play()
	enemy_defeated.play()
	enemy_death_timer.start()

func collisiondeath():
	enemy_hit_box.call_deferred("queue_free") 
	enemy_shape.call_deferred("queue_free") 
	enemy_dead_box.call_deferred("queue_free") 
