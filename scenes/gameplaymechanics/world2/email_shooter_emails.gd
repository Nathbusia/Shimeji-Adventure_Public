extends CharacterBody2D

var speed = -440.0
var fall = 190.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var game_manager: GameManager = $"../../../GameManager"
@onready var game_manager_boss: GameManager = $"../../GameManager"


@onready var trigger_hitbox: Area2D = $TriggerHitbox
@onready var enemy_step_on_sound: AudioStreamPlayer = $SFX/EnemyStepOnSound
@onready var enemy_step_on_hard: AudioStreamPlayer = $SFX/EnemyStepOnHard
@onready var mailbox_spin: AudioStreamPlayer2D = $SFX/MailboxSpin
@onready var mailbox_hit: AudioStreamPlayer2D = $SFX/MailboxHit
@onready var mail_animation: AnimationPlayer = $MailAnimation
@onready var mail_animation_spin: AnimationPlayer = $MailAnimationSpin
@onready var main_hitbox: CollisionShape2D = $MainHitbox
@onready var lifetime: Timer = $Lifetime

var has_attacked = false

func _physics_process(_delta):
	
	if has_attacked:
		return
	
	velocity.y = speed
	
	move_and_slide()
	
	var overlapping_objects = $TriggerHitbox.get_overlapping_areas()
	
	for area in overlapping_objects:
		if area.get_parent().is_in_group("Enemies"):
			area.get_parent().death()
			mailbox_hit.play()
			mailbox_spin.play()
			mail_animation.play("hit")
			mail_animation_spin.play("spin")
			velocity.y -= fall
			lifetime.stop()
			gothit()
			has_attacked = true
		if area.get_parent().is_in_group("pete_hurtbox"):
			if not area.get_parent().is_shield:
				if game_manager_boss.boss_health == 1:
					if not has_attacked:
						area.get_parent().boss_defeated()
						mailbox_hit.play()
						mailbox_spin.play()
						mail_animation.play("hit")
						mail_animation_spin.play("spin")
						velocity.y -= fall
						lifetime.stop()
						gothit()
						has_attacked = true
				else:
					if not has_attacked:
						area.get_parent().boss_took_damaged()
						mailbox_hit.play()
						mailbox_spin.play()
						mail_animation.play("hit")
						mail_animation_spin.play("spin")
						velocity.y -= fall
						lifetime.stop()
						gothit()
						has_attacked = true

func delete():
	queue_free()

func gothit():
	main_hitbox.disabled = true


func _on_lifetime_timeout() -> void:
	queue_free()
