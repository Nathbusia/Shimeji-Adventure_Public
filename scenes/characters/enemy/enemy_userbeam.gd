extends CharacterBody2D

var speed = -120.0
var flick = -660.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var user_beam: AnimatedSprite2D = $UserBeam
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var enemy_death_timer: Timer = $EnemyDeathTimer
@onready var mean_animation_player: AnimationPlayer = $Mean_AnimationPlayer
@onready var enemy_shape: CollisionShape2D = $EnemyShape
@onready var enemy_hit_box: CollisionShape2D = $Area2D/EnemyHitBox
@onready var enemy_step_on_sound: AudioStreamPlayer = $EnemyStepOnSound
@onready var enemy_defeated: AudioStreamPlayer = $EnemyDefeated
@onready var enemy_step_on_hard: AudioStreamPlayer = $EnemyStepOnHard
@onready var arrow_spawner_left: Marker2D = $ArrowSpawner_Left
@onready var arrow_spawner_right: Marker2D = $ArrowSpawner_Right
@onready var detect_collision_l: CollisionShape2D = $PlayerDetector/DetectCollisionL
@onready var damage_vox: AudioStreamPlayer2D = $Voice/DamageVox
@onready var defeat_vox: AudioStreamPlayer2D = $Voice/DefeatVox
@onready var attack_intro_sfx: AudioStreamPlayer2D = $SFX/AttackIntroSFX
@onready var beam_attack_sfx: AudioStreamPlayer2D = $SFX/BeamAttackSFX
@onready var damage_sfx: AudioStreamPlayer2D = $SFX/DamageSFX
@onready var player_detector: Area2D = $PlayerDetector
@onready var projectile_timeout: Timer = $ProjectileTimeout

@onready var detect_collision_r: CollisionShape2D = $PlayerDetector/DetectCollisionR


var is_dead = false
var has_taken_damaged = false
var can_detect = true
var attack_mode = false
var bouce = -600.0
var health = 3

var facing_right = false
var back_to_idle : Array = [14]
var no_more_hurt : Array = [8]
var threw_soundplay : Array = [1]
var threw_voiceplay : Array = [8]

@onready var beam = preload("res://scenes/characters/enemy/laserbeam_projectile.tscn")

var arrow_path = ""
var slameffectRight_path = ""

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()

func attack():
	attack_mode = true
	user_beam.animation = "attack"
			

func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	
	if (body.name == "ShimejiCharacter_Playable"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			health -= 1
			if health == 0:
				is_dead = true
				has_taken_damaged = true
				collisiondeath()
				user_beam.animation = "defeat"
				mean_animation_player.play("death")
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				defeat_vox.play()
				enemy_death_timer.start()
				body.bounce()
				body.jump_count = 1
			else:
				has_taken_damaged = true
				if attack_mode:
					attack_mode = false
				user_beam.animation = "hurt"
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				damage_vox.play()
				damage_sfx.play()
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

	if (body.name == "ShimejiCharacter_Playable_Player2"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			health -= 1
			if health == 0:
				is_dead = true
				has_taken_damaged = true
				collisiondeath()
				user_beam.animation = "defeat"
				mean_animation_player.play("death")
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				defeat_vox.play()
				enemy_death_timer.start()
				body.bounce()
				body.jump_count = 1
			else:
				has_taken_damaged = true
				if attack_mode:
					attack_mode = false
				user_beam.animation = "hurt"
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				damage_vox.play()
				damage_sfx.play()
				body.bounce()
				body.jump_count = 1
		elif (y_delta < -40):
			velocity.y = bouce
		else:
			if game_manager.health_p2 == 1:
				game_manager.lose_health_player2()
				game_manager.lives_p2 -= 1
				body.death()
				body.play_death_effect("death")
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player2()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")

	if (body.name == "ShimejiCharacter_Playable_Player3"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			health -= 1
			if health == 0:
				is_dead = true
				has_taken_damaged = true
				collisiondeath()
				user_beam.animation = "defeat"
				mean_animation_player.play("death")
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				defeat_vox.play()
				enemy_death_timer.start()
				body.bounce()
				body.jump_count = 1
			else:
				has_taken_damaged = true
				if attack_mode:
					attack_mode = false
				user_beam.animation = "hurt"
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				damage_vox.play()
				damage_sfx.play()
				body.bounce()
				body.jump_count = 1
		elif (y_delta < -40):
			velocity.y = bouce
		else:
			if game_manager.health_p3 == 1:
				game_manager.lose_health_player3()
				game_manager.lives_p3 -= 1
				body.death()
				body.play_death_effect("death")
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player3()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")
					
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			health -= 1
			if health == 0:
				is_dead = true
				has_taken_damaged = true
				collisiondeath()
				user_beam.animation = "defeat"
				mean_animation_player.play("death")
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				defeat_vox.play()
				enemy_death_timer.start()
				body.bounce()
				body.jump_count = 1
			else:
				has_taken_damaged = true
				if attack_mode:
					attack_mode = false
				user_beam.animation = "hurt"
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				damage_vox.play()
				damage_sfx.play()
				body.bounce()
				body.jump_count = 1
		elif (y_delta < -40):
			velocity.y = bouce
		else:
			if game_manager.health_p4 == 1:
				game_manager.lose_health_player4()
				game_manager.lives_p4 -= 1
				body.death()
				body.play_death_effect("death")
			else:
				if body.is_invincible == true:
					return
				else:
					game_manager.lose_health_player4()
					body.get_hurt()
					body.hurt_invincible()
					body.play_damaged_effect("blink")

func death():
	is_dead = true
	collisiondeath()
	user_beam.animation = "defeat"
	defeat_vox.play()
	mean_animation_player.play("death")
	enemy_step_on_sound.play()
	enemy_death_timer.start()

func _on_enemy_death_timer_timeout() -> void:
	queue_free()

func collisiondeath():
	enemy_hit_box.call_deferred("queue_free") 
	enemy_shape.call_deferred("queue_free") 


func _on_player_detector_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && can_detect:
		can_detect = false
		user_beam.flip_h = false
		attack()
	if (body.name == "ShimejiCharacter_Playable_Player2") && can_detect:
		can_detect = false
		user_beam.flip_h = false
		attack()
	if (body.name == "ShimejiCharacter_Playable_Player3") && can_detect:
		can_detect = false
		user_beam.flip_h = false
		attack()
	if (body.name == "ShimejiCharacter_Playable_Player4") && can_detect:
		can_detect = false
		user_beam.flip_h = false
		attack()



func spawn_arrow():
		var scene = get_node("..") 
		var Arrow = beam.instantiate()
		if user_beam.flip_h == true:
			Arrow.global_position = arrow_spawner_right.global_position
			Arrow.flip()
		else:
			Arrow.global_position = arrow_spawner_left.global_position
		scene.add_child(Arrow)


func _on_shooter_frame_changed() -> void:
	if user_beam.animation == "attack":
		if user_beam.frame in threw_soundplay:
			attack_intro_sfx.play()
		elif user_beam.frame in threw_voiceplay:
			beam_attack_sfx.play()
			spawn_arrow()
		elif user_beam.frame in back_to_idle:
			user_beam.animation = "idle"
			projectile_timeout.start()
	if user_beam.animation == "hurt":
		if user_beam.frame in no_more_hurt:
			user_beam.animation = "idle"
			projectile_timeout.start()


func _on_projectile_timeout_timeout() -> void:
	can_detect = true
	attack_mode = false
	projectile_timeout.stop()


func _on_player_detector_r_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && can_detect:
		can_detect = false
		user_beam.flip_h = true
		attack()
	if (body.name == "ShimejiCharacter_Playable_Player2") && can_detect:
		can_detect = false
		user_beam.flip_h = true
		attack()
	if (body.name == "ShimejiCharacter_Playable_Player3") && can_detect:
		can_detect = false
		user_beam.flip_h = true
		attack()
	if (body.name == "ShimejiCharacter_Playable_Player4") && can_detect:
		can_detect = false
		user_beam.flip_h = true
		attack()
