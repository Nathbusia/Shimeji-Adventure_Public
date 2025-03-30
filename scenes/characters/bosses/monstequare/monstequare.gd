extends CharacterBody2D

var speed = -90.0
var flick = -660.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var randomchance = RandomNumberGenerator

@onready var monstequare_sprite: AnimatedSprite2D = $MonstequareSprite
@onready var monstequare_anim: AnimationPlayer = $MonstequareAnim
@onready var spawn_effect: AnimatedSprite2D = $SpawnEffect
@onready var boss_collision: CollisionShape2D = $BossCollision
@onready var projectile_spawner: Marker2D = $ProjectileSpawner
@onready var enemy_spawner: Marker2D = $EnemySpawner
@onready var finish_star_appear: Marker2D = $FinishStarAppear
@onready var game_manager: GameManager = $"../../GameManager"
@onready var green_box: RigidBody2D = $"../GreenBox"
@onready var hitbox_collision: CollisionShape2D = $BossHitbox/HitboxCollision

#Timer
@onready var performing_attack_time: Timer = $Timers/PerformingAttackTime
@onready var hold_in_roar: Timer = $Timers/HoldInRoar

#SFX
@onready var intro_start_sfx: AudioStreamPlayer2D = $SFX/IntroStartSFX
@onready var intro_roar_sfx: AudioStreamPlayer2D = $SFX/IntroRoarSFX
@onready var spit_sfx: AudioStreamPlayer2D = $SFX/SpitSFX
@onready var damage_sfx: AudioStreamPlayer2D = $SFX/DamageSFX
@onready var summon_sfx: AudioStreamPlayer2D = $SFX/SummonSFX
@onready var defeated_sfx: AudioStreamPlayer2D = $SFX/DefeatedSFX

#Vox
@onready var defeated_vox: AudioStreamPlayer2D = $Voices/DefeatedVox
@onready var damage_vox: AudioStreamPlayer2D = $Voices/DamageVox
@onready var intro_start_vox: AudioStreamPlayer2D = $Voices/IntroStartVox
@onready var intro_roar_vox: AudioStreamPlayer2D = $Voices/IntroRoarVox
@onready var spit_vox: AudioStreamPlayer2D = $Voices/SpitVox
@onready var summon_vox: AudioStreamPlayer2D = $Voices/SummonVox


var is_dead = false
var has_taken_damaged = false

var facing_right = false
var introstartend : Array = [8]
var introstartframe: Array = [2]
var roarstartframe : Array = [2]
var startattack_frame : Array = [22]
var spitproject : Array = [2]
var startsummoneffect : Array = [2]
var startdeathloop : Array = [5]
var endspit : Array = [5]
var endsummon : Array = [12]
var enddamage : Array = [5]

var summonenemyframe : Array = [3]
var endsummoneffect : Array = [6]

#Summon Stuff
var whitebox_path = ""
var greenbox_path = ""
var meanball_path = ""
var meansquare_path = ""
var voltslam_path = ""
var shooter_path = ""
var star_path = ""

func _ready() -> void:
	randomchance = RandomNumberGenerator.new()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	move_and_slide()

func startattack():
		monstequare_sprite.animation = "idle"
		performing_attack_time.start()
	
func spitattack():
	var scene = get_node("../MeanBalls") 
	whitebox_path = "res://scenes/characters/bosses/monstequare/whitesquare_projectile.tscn"
	var Box = load(whitebox_path).instantiate()
	Box.global_position = projectile_spawner.global_position
	scene.add_child(Box)

func spitattackgreen():
	var scene = get_node("..") 
	greenbox_path = "res://scenes/characters/bosses/monstequare/greensquare_projectile.tscn"
	var GreenBox = load(greenbox_path).instantiate()
	GreenBox.global_position = projectile_spawner.global_position
	scene.add_child(GreenBox)

func summonenemy_meanball():
	var scene = get_node("../MeanBalls") 
	meanball_path = "res://scenes/characters/enemy/enemy_mean_ball.tscn"
	var MeanBall = load(meanball_path).instantiate()
	MeanBall.global_position = enemy_spawner.global_position
	scene.add_child(MeanBall)

func summonenemy_meansquare():
	var scene = get_node("../MeanBalls") 
	meansquare_path = "res://scenes/characters/enemy/enemy_mean_square.tscn"
	var MeanSquare = load(meansquare_path).instantiate()
	MeanSquare.global_position = enemy_spawner.global_position
	scene.add_child(MeanSquare)

func summonenemy_voltslam():
	var scene = get_node("../MeanBalls") 
	voltslam_path = "res://scenes/characters/enemy/enemy_voltslam.tscn"
	var VoltSlam = load(voltslam_path).instantiate()
	VoltSlam.global_position = enemy_spawner.global_position
	scene.add_child(VoltSlam)

func summonenemy_shooter():
	var scene = get_node("../MeanBalls") 
	shooter_path = "res://scenes/characters/enemy/enemy_shooter.tscn"
	var Shooter = load(shooter_path).instantiate()
	Shooter.global_position = enemy_spawner.global_position
	scene.add_child(Shooter)

func spawn_star():
	var scene = get_node("../../SceneObjects") 
	star_path = "res://scenes/collectable/finish_star.tscn"
	var FinishStar = load(star_path).instantiate()
	FinishStar.global_position = finish_star_appear.global_position
	scene.add_child(FinishStar)

func _on_monstequare_sprite_frame_changed() -> void:
	if monstequare_sprite.animation == "intro_start":
		if monstequare_sprite.frame in introstartend:
			hold_in_roar.start()
		if monstequare_sprite.frame in introstartframe:
			intro_start_sfx.play()
			intro_start_vox.play()
	if monstequare_sprite.animation == "intro_roar":
		if monstequare_sprite.frame in roarstartframe:
			intro_roar_sfx.play()
		if monstequare_sprite.frame in startattack_frame:
			startattack()
	if monstequare_sprite.animation == "spit":
		if monstequare_sprite.frame in spitproject:
			var spitchance = randomchance.randi_range(1, 10)
			if spitchance >= 6:
				spitattackgreen()
			else:
				spitattack()
		if monstequare_sprite.frame in endspit:
			startattack()
	if monstequare_sprite.animation == "summon":
		if monstequare_sprite.frame in startsummoneffect:
			spawn_effect.play("spawn")
		if monstequare_sprite.frame in endsummon:
			startattack()
	if spawn_effect.animation == "spawn":
		if spawn_effect.frame in summonenemyframe:
			var summonchance = randomchance.randi_range(1, 4)
			if summonchance == 1:
				summonenemy_meanball()
			if summonchance == 2:
				summonenemy_meansquare()
			if summonchance == 3:
				summonenemy_voltslam()
			if summonchance == 4:
				summonenemy_shooter()
		if spawn_effect.frame in endsummoneffect:
			spawn_effect.play("none")
	if monstequare_sprite.animation == "damage":
		if monstequare_sprite.frame in enddamage:
			has_taken_damaged = false
			startattack()
	if monstequare_sprite.animation == "death":
		if monstequare_sprite.frame in startdeathloop:
			monstequare_sprite.play("death_loop")

func time_to_spit():
	monstequare_sprite.play("spit")
	spit_vox.play()
	spit_sfx.play()

func time_to_summon():
	monstequare_sprite.play("summon")
	summon_vox.play()
	summon_sfx.play()


func _on_hold_in_roar_timeout() -> void:
	monstequare_sprite.play("intro_roar")
	intro_roar_vox.play()
	hold_in_roar.stop() #To prevent it from repeating itself


func _on_performing_attack_time_timeout() -> void:
	var attackchance = randomchance.randi_range(1, 20)
	if attackchance >= 5:
		time_to_spit()
	else:
		time_to_summon()
	performing_attack_time.stop()

func boss_took_damaged():
	game_manager.boss_lose_health()
	has_taken_damaged = true
	monstequare_sprite.animation = "damage"
	damage_vox.play()
	damage_sfx.play()
func boss_defeated():
	game_manager.boss_lose_health()
	is_dead = true
	has_taken_damaged = true
	monstequare_sprite.play("death")
	monstequare_anim.play("death")
	defeated_vox.play()
	defeated_sfx.play()
	hitbox_collision.queue_free()
	performing_attack_time.stop()
	game_manager.finish_boss()
func boss_disappear():
	spawn_star()
	queue_free()
	

func _on_boss_hitbox_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		if game_manager.health < 0:
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
