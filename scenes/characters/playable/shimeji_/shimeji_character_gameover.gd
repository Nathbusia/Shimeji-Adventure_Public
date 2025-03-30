extends Node2D

@onready var game_over_anim: AnimationPlayer = $GameOverAnim
@onready var sfx_move_crouching: AudioStreamPlayer = $PlayerSFX/Move_Crouching
@onready var footsteps_sounds: AudioStreamPlayer = $PlayerSFX/FootstepsSounds
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var shime_fall_anim: AnimationPlayer = $ShimeFallAnim

var footsteps_frames : Array = [0, 2]
var crouch_frames : Array = [0]

func falling():
	sprite_2d.animation = "fall"
	shime_fall_anim.play("falloff")

func crash_land():
	game_over_anim.play("crash")

func idle_laying():
	game_over_anim.play("crash_idle")

func yes_click():
	game_over_anim.play("yes")

func no_click():
	game_over_anim.play("no")

func idle():
	sprite_2d.animation = "idle"


func _on_sprite_2d_frame_changed() -> void:
	if sprite_2d.animation == "walk" or sprite_2d.animation == "run" or sprite_2d.animation == "carry" or sprite_2d.animation == "carry_fast":
		if sprite_2d.frame in footsteps_frames:
			footsteps_sounds.play()
			sfx_move_crouching.stop()
	elif sprite_2d.animation == "crouching" or sprite_2d.animation == "crouching_fast":
		if sprite_2d.frame in crouch_frames:
			sfx_move_crouching.play()
			footsteps_sounds.stop()
	else:
		footsteps_sounds.stop()
		sfx_move_crouching.stop()
		return
	
