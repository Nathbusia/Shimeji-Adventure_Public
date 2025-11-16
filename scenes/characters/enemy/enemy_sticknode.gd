extends RigidBody2D

var is_sticking = false
var is_dying = false

@onready var refuse: AudioStreamPlayer2D = $SFX/Refuse
@onready var defeat: AudioStreamPlayer2D = $SFX/Defeat
@onready var sticknode_animations: AnimationPlayer = $Animation/Sticknode_Animations
@onready var enemy_step_on_sound: AudioStreamPlayer = $EnemyStepOnSound
@onready var enemy_step_on_hard: AudioStreamPlayer = $EnemyStepOnHard
@onready var enemy_death_timer: Timer = $EnemyDeathTimer
@onready var sticknode: AnimatedSprite2D = $Sticknode
@onready var main_hitbox: CollisionShape2D = $MainHitbox
@onready var trigger_hitbox: CollisionShape2D = $TriggerHitbox/TriggerHitbox
@onready var particles_spawn: Marker2D = $ParticlesSpawn

var back_to_idle : Array = [11]
var lose_sticknode = false
#Particle Stuff
@onready var particle = preload("res://scenes/characters/enemy/enemy_sticknode_particles.tscn")
var particle_path = ""

func _process(delta: float) -> void:
	var overlapping_objects = $StickTrigger.get_overlapping_areas()
		
	for area in overlapping_objects:
		if area.get_parent().is_in_group("dragwindows"):
			area.get_parent().got_sticked = true
			is_sticking = true
			freeze = true

		if area.get_parent().is_in_group("popout_pete"):
			area.get_parent().collision_hurtbox.disabled = true
			is_sticking = true
			freeze = true

func _on_trigger_hitbox_body_entered(body: Node2D) -> void:
	if is_dying:
		return
	
	if (body.name == "ShimejiCharacter_Playable"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			is_dying = true
			collisiondeath()
			sticknode.animation = "defeat"
			sticknode_animations.play("defeat")
			if body.is_fastfalling:
				enemy_step_on_hard.play()
			else:
				enemy_step_on_sound.play()
			defeat.play()
			enemy_death_timer.start()
			body.bounce()
			body.jump_count = 1
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			is_dying = true
			collisiondeath()
			sticknode.animation = "defeat"
			sticknode_animations.play("defeat")
			if body.is_fastfalling:
				enemy_step_on_hard.play()
			else:
				enemy_step_on_sound.play()
			defeat.play()
			enemy_death_timer.start()
			body.bounce()
			body.jump_count = 1
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			is_dying = true
			collisiondeath()
			sticknode.animation = "defeat"
			sticknode_animations.play("defeat")
			if body.is_fastfalling:
				enemy_step_on_hard.play()
			else:
				enemy_step_on_sound.play()
			defeat.play()
			enemy_death_timer.start()
			body.bounce()
			body.jump_count = 1
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			is_dying = true
			collisiondeath()
			sticknode.animation = "defeat"
			sticknode_animations.play("defeat")
			if body.is_fastfalling:
				enemy_step_on_hard.play()
			else:
				enemy_step_on_sound.play()
			defeat.play()
			enemy_death_timer.start()
			body.bounce()
			body.jump_count = 1

func death():
	is_dying = true
	collisiondeath()
	sticknode.animation = "defeat"
	sticknode_animations.play("defeat")
	enemy_step_on_sound.play()
	defeat.play()
	enemy_death_timer.start()

func collisiondeath():
	trigger_hitbox.disabled = true

func _on_enemy_death_timer_timeout() -> void:
	var overlapping_objects = $StickTrigger.get_overlapping_areas()
		
	for area in overlapping_objects:
		if area.get_parent().is_in_group("dragwindows"):
			area.get_parent().got_sticked = false

		if area.get_parent().is_in_group("popout_pete"):
			lose_sticknode = true
			if lose_sticknode:
				area.get_parent().sticknodeamount -= 1 #So it doesn't do it twice.
				if area.get_parent().sticknodeamount == 0:
					area.get_parent().is_shield = false
			area.get_parent().sticknodecount()
	queue_free()

func particlesspawn():
	var scene = get_node("../../MeanBalls") 
	var Particles = particle.instantiate()
	Particles.global_position = particles_spawn.global_position
	scene.add_child(Particles)

func stickrefuse():
	sticknode.animation = "refuse"
	sticknode_animations.play("refuse")
	refuse.play()


func _on_sticknode_frame_changed() -> void:
	if sticknode.animation == "refuse":
		if sticknode.frame in back_to_idle:
			sticknode.play("idle")
