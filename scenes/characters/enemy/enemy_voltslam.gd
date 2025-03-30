extends CharacterBody2D

var speed = -90.0
var flick = -660.0
var bouce = -600.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var volt_slam: AnimatedSprite2D = $VoltSlam
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var enemy_death_timer: Timer = $EnemyDeathTimer
@onready var mean_animation_player: AnimationPlayer = $Mean_AnimationPlayer
@onready var enemy_shape: CollisionShape2D = $EnemyShape
@onready var enemy_hit_box: CollisionShape2D = $Area2D/EnemyHitBox
@onready var enemy_dead_box: CollisionShape2D = $Area2D/EnemyDeadBox
@onready var enemy_step_on_sound: AudioStreamPlayer = $EnemyStepOnSound
@onready var enemy_defeated: AudioStreamPlayer = $EnemyDefeated
@onready var enemy_step_on_hard: AudioStreamPlayer = $EnemyStepOnHard
@onready var electro_effect_spawner_left: Marker2D = $ElectroEffectSpawner_Left
@onready var electro_effect_spawner_right: Marker2D = $ElectroEffectSpawner_Right
@onready var detect_collision_l: CollisionShape2D = $PlayerDetector/DetectCollisionL
@onready var detect_collision_r: CollisionShape2D = $PlayerDetector/DetectCollisionR
@onready var air_time: Timer = $AirTime
@onready var slam_time: Timer = $SlamTime
@onready var damaged_sfx: AudioStreamPlayer2D = $VoltSFX/DamagedSFX
@onready var defeated_sfx: AudioStreamPlayer2D = $VoltSFX/DefeatedSFX
@onready var jump_sfx: AudioStreamPlayer2D = $VoltSFX/JumpSFX
@onready var slam_sfx: AudioStreamPlayer2D = $VoltSFX/SlamSFX
@onready var electro_on_sfx: AudioStreamPlayer2D = $VoltSFX/ElectroOnSFX
@onready var attack_voice: AudioStreamPlayer2D = $VoltVoice/AttackVoice
@onready var damaged_voice: AudioStreamPlayer2D = $VoltVoice/DamagedVoice
@onready var death_voice: AudioStreamPlayer2D = $VoltVoice/DeathVoice
@onready var volt_slam_animation: AnimationPlayer = $VoltSlam_Animation
@onready var electro_sfx_loop: AudioStreamPlayer2D = $VoltSFX/ElectroSFXLoop


var is_dead = false
var has_taken_damaged = false
var can_detect = true
var attack_mode = false
var is_electro = false
var can_slam = false
var has_slam = false
var health = 2

var facing_right = false
var ready_to_jump_frames : Array = [11]
var back_to_idle : Array = [8]
var damaged_back_to_idle : Array = [18]

var slameffect_path = ""
var slameffectRight_path = ""

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()

func attack():
	attack_mode = true
	volt_slam.animation = "attack_intro"
	attack_voice.play()
			

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
				volt_slam.animation = "death"
				mean_animation_player.play("death")
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				death_voice.play()
				defeated_sfx.play()
				enemy_death_timer.start()
				body.bounce()
				body.jump_count = 1
			else:
				has_taken_damaged = true
				if attack_mode:
					attack_mode = false
				volt_slam.animation = "damaged"
				volt_slam_animation.play("low_health")
				if body.is_fastfalling:
					enemy_step_on_hard.play()
				else:
					enemy_step_on_sound.play()
				damaged_voice.play()
				damaged_sfx.play()
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
	health -= 1
	if health == 0:
		is_dead = true
		has_taken_damaged = true
		collisiondeath()
		volt_slam.animation = "death"
		mean_animation_player.play("death")
		enemy_step_on_sound.play()
		death_voice.play()
		defeated_sfx.play()
		enemy_death_timer.start()
	else:
		has_taken_damaged = true
		if attack_mode:
			attack_mode = false
		volt_slam.animation = "damaged"
		volt_slam_animation.play("low_health")
		enemy_step_on_sound.play()
		damaged_voice.play()
		damaged_sfx.play()

func _on_enemy_death_timer_timeout() -> void:
	queue_free()

func collisiondeath():
	enemy_hit_box.call_deferred("queue_free") 
	enemy_shape.call_deferred("queue_free") 
	enemy_dead_box.call_deferred("queue_free") 


func _on_player_detector_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && can_detect && !is_dead && !has_taken_damaged:
		can_detect = false
		attack()


func _on_volt_slam_frame_changed() -> void:
	if volt_slam.animation == "attack_intro":
		if volt_slam.frame in ready_to_jump_frames:
			volt_slam.play("attack_jump")
			velocity.y = flick
			jump_sfx.play()
			electro_on_sfx.play()
			air_time.start()
	elif volt_slam.animation == "attack_outro":
		if volt_slam.frame in back_to_idle:
			volt_slam.animation = "idle"
			air_time.stop()
			slam_time.stop()
			can_detect = true
	elif volt_slam.animation == "damaged":
		if volt_slam.frame in damaged_back_to_idle:
			volt_slam.animation = "idle"
			has_taken_damaged = false
			can_detect = true

func _on_air_time_timeout() -> void:
	can_slam = true
	if is_on_floor() && attack_mode:
		if has_slam:
			return
		else:
			volt_slam.play("attack_slam")
			slam_sfx.play()
			electro_sfx_loop.play()
			spawn_slameffect()
			spawn_slameffectRight()
			slam_time.start()
			has_slam = true

func _on_slam_time_timeout() -> void:
	volt_slam.play("attack_outro")
	attack_mode = false
	is_electro = false
	has_slam = false
	can_slam = false

func spawn_slameffect():
		var scene = get_node("..") 
		slameffect_path = "res://scenes/characters/enemy/enemy_voltslam_electroeffect.tscn"
		var SlamEffect = load(slameffect_path).instantiate()
		SlamEffect.global_position = electro_effect_spawner_left.global_position
		scene.add_child(SlamEffect)

func spawn_slameffectRight():
		var scene = get_node("..") 
		slameffectRight_path = "res://scenes/characters/enemy/enemy_voltslam_electroeffect.tscn"
		var SlamEffectRight = load(slameffectRight_path).instantiate()
		SlamEffectRight.global_position = electro_effect_spawner_right.global_position
		scene.add_child(SlamEffectRight)
		SlamEffectRight.flip()
