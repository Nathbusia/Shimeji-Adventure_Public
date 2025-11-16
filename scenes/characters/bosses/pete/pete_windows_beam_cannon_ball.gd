extends CharacterBody2D

var speed = 238.0
var speed_left = -238.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var game_manager: GameManager = $"../../../GameManager"

@onready var ball_anim: AnimatedSprite2D = $BallAnim

@onready var main_collision: CollisionShape2D = $MainCollision
@onready var trigger_collision: CollisionShape2D = $TriggerHitbox/TriggerCollision
@onready var wall_destory: CollisionShape2D = $WallTrigger/WallDestory
@onready var wall_destory_l: CollisionShape2D = $WallTrigger/WallDestoryL

@onready var active: AudioStreamPlayer2D = $SFX/Active
@onready var hit: AudioStreamPlayer2D = $SFX/Hit
@onready var damage: AudioStreamPlayer2D = $SFX/Damage

@onready var trigger_hitbox: Area2D = $TriggerHitbox
@onready var wall_trigger: Area2D = $WallTrigger
@onready var hit_timer: Timer = $HitTimer

var triggered = false

var vanishsprite : Array = [3]

var facing_left = false

func _physics_process(_delta):
	
	if facing_left:
		velocity.x = speed_left
	else:
		velocity.x = speed
	move_and_slide()

func bursted():
	ball_anim.play("burst")
	hit.play()
	active.stop()
	main_collision.disabled = true
	trigger_collision.disabled = true
	wall_destory.disabled = true
	wall_destory_l.disabled = true
	speed = 0
	hit_timer.start()

func _on_hit_timer_timeout() -> void:
	queue_free()

func _on_trigger_hitbox_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
			if game_manager.health == 1:
				game_manager.lose_health()
				game_manager.lives -= 1
				body.death()
				body.play_death_effect("death")
				triggered = true
				bursted()
				damage.play()
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					triggered = true
					bursted()
					damage.play()

	if (body.name == "ShimejiCharacter_Playable_Player2"):
			if game_manager.health_p2 == 1:
				game_manager.lose_health_player2()
				game_manager.lives_p2 -= 1
				body.death()
				body.play_death_effect("death")
				triggered = true
				bursted()
				damage.play()
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player2()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					triggered = true
					bursted()
					damage.play()

	if (body.name == "ShimejiCharacter_Playable_Player3"):
			if game_manager.health_p3 == 1:
				game_manager.lose_health_player3()
				game_manager.lives_p3 -= 1
				body.death()
				body.play_death_effect("death")
				triggered = true
				bursted()
				damage.play()
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player3()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					triggered = true
					bursted()
					damage.play()

	if (body.name == "ShimejiCharacter_Playable_Player4"):
			if game_manager.health_p4 == 1:
				game_manager.lose_health_player4()
				game_manager.lives_p4 -= 1
				body.death()
				body.play_death_effect("death")
				triggered = true
				bursted()
				damage.play()
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player4()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					triggered = true
					bursted()
					damage.play()
					if not is_on_floor():
						velocity.y += gravity 


func _on_ball_anim_frame_changed() -> void:
	if ball_anim.animation == "burst":
		if ball_anim.frame in vanishsprite:
			ball_anim.visible = false
