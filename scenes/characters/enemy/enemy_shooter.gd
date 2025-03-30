extends CharacterBody2D

var speed = -90.0
var flick = -660.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var shooter: AnimatedSprite2D = $Shooter
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
@onready var attack_voice: AudioStreamPlayer2D = $Voice/AttackVoice
@onready var defeat_voice: AudioStreamPlayer2D = $Voice/DefeatVoice
@onready var throw_sfx: AudioStreamPlayer2D = $SFX/ThrowSFX
@onready var player_detector: Area2D = $PlayerDetector
@onready var projectile_timeout: Timer = $ProjectileTimeout

var is_dead = false
var can_detect = true
var attack_mode = false
var bouce = -600.0

var facing_right = false
var back_to_idle : Array = [12]
var threw_soundplay : Array = [6]
var threw_voiceplay : Array = [9]

var arrow_path = ""
var slameffectRight_path = ""

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()

func attack():
	attack_mode = true
	shooter.animation = "throw"
			

func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	
	if (body.name == "ShimejiCharacter_Playable"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			is_dead = true
			collisiondeath()
			shooter.animation = "death"
			defeat_voice.play()
			mean_animation_player.play("death")
			if body.is_fastfalling:
				enemy_step_on_hard.play()
			else:
				enemy_step_on_sound.play()
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
	shooter.animation = "death"
	defeat_voice.play()
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
		attack()


func spawn_arrow():
		var scene = get_node("..") 
		arrow_path = "res://scenes/characters/enemy/arrow_projectile.tscn"
		var Arrow = load(arrow_path).instantiate()
		Arrow.global_position = arrow_spawner_left.global_position
		scene.add_child(Arrow)


func _on_shooter_frame_changed() -> void:
	if shooter.animation == "throw":
		if shooter.frame in threw_soundplay:
			throw_sfx.play()
		elif shooter.frame in threw_voiceplay:
			attack_voice.play()
			spawn_arrow()
		elif shooter.frame in back_to_idle:
			shooter.animation = "idle"
			projectile_timeout.start()


func _on_projectile_timeout_timeout() -> void:
	can_detect = true
	attack_mode = false
	projectile_timeout.stop()
