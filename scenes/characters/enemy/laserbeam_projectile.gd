extends CharacterBody2D

var speed = -238.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var arrow: AnimatedSprite2D = $Arrow
@onready var laserbeam: AnimatedSprite2D = $Laserbeam
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var enemy_death_timer: Timer = $EnemyDeathTimer
@onready var enemy_shape: CollisionShape2D = $EnemyShape
@onready var enemy_hit_box: CollisionShape2D = $Area2D/EnemyHitBox
@onready var enemy_dead_box: CollisionShape2D = $Area2D/EnemyDeadBox
@onready var enemy_step_on_sound: AudioStreamPlayer = $EnemyStepOnSound
@onready var enemy_defeated: AudioStreamPlayer = $EnemyDefeated
@onready var enemy_step_on_hard: AudioStreamPlayer = $EnemyStepOnHard
@onready var defeat_sfx: AudioStreamPlayer2D = $DefeatSFX
@onready var projectile_hit_box: CollisionShape2D = $ProjectileBox/ProjectileHitBox
@onready var main_hit_box: CollisionShape2D = $MainHitBox
@onready var arrow_anim: AnimationPlayer = $ArrowAnim

var is_dead = false

var facing_right = false

func _physics_process(_delta):
	
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func _on_lifespan_timeout() -> void:
	queue_free()


func _on_projectile_box_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
			if game_manager.health == 1:
				game_manager.lose_health()
				game_manager.lives -= 1
				body.death()
				body.play_death_effect("death")
				is_dead = true
				collisiondeath()
				laserbeam.animation = "hit"
				defeat_sfx.play()
				arrow_anim.play("defeat")
				enemy_death_timer.start()
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					is_dead = true
					collisiondeath()
					laserbeam.animation = "hit"
					defeat_sfx.play()
					arrow_anim.play("defeat")
					enemy_death_timer.start()

	if (body.name == "ShimejiCharacter_Playable_Player2"):
			if game_manager.health_p2 == 1:
				game_manager.lose_health_player2()
				game_manager.lives_p2 -= 1
				body.death()
				body.play_death_effect("death")
				is_dead = true
				collisiondeath()
				laserbeam.animation = "hit"
				defeat_sfx.play()
				arrow_anim.play("defeat")
				enemy_death_timer.start()
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player2()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					is_dead = true
					collisiondeath()
					laserbeam.animation = "hit"
					defeat_sfx.play()
					arrow_anim.play("defeat")
					enemy_death_timer.start()

	if (body.name == "ShimejiCharacter_Playable_Player3"):
			if game_manager.health_p3 == 1:
				game_manager.lose_health_player3()
				game_manager.lives_p3 -= 1
				body.death()
				body.play_death_effect("death")
				is_dead = true
				collisiondeath()
				laserbeam.animation = "hit"
				defeat_sfx.play()
				arrow_anim.play("defeat")
				enemy_death_timer.start()
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player3()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					is_dead = true
					collisiondeath()
					laserbeam.animation = "hit"
					defeat_sfx.play()
					arrow_anim.play("defeat")
					enemy_death_timer.start()

	if (body.name == "ShimejiCharacter_Playable_Player4"):
			if game_manager.health_p4 == 1:
				game_manager.lose_health_player4()
				game_manager.lives_p4 -= 1
				body.death()
				body.play_death_effect("death")
				is_dead = true
				collisiondeath()
				laserbeam.animation = "hit"
				defeat_sfx.play()
				arrow_anim.play("defeat")
				enemy_death_timer.start()
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player4()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					is_dead = true
					collisiondeath()
					laserbeam.animation = "hit"
					defeat_sfx.play()
					arrow_anim.play("defeat")
					enemy_death_timer.start()
					if not is_on_floor():
						velocity.y += gravity 
func collisiondeath():
	projectile_hit_box.call_deferred("queue_free") 
	main_hit_box.call_deferred("queue_free") 
