extends Node2D

@onready var cutscene_anim: AnimationPlayer = $CutsceneAnim
@onready var sfx_move_crouching: AudioStreamPlayer = $PlayerSFX/Move_Crouching
@onready var footsteps_sounds: AudioStreamPlayer = $PlayerSFX/FootstepsSounds
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var shime_fall_anim: AnimationPlayer = $ShimeFallAnim

var footsteps_frames : Array = [0, 2]
var crouch_frames : Array = [0]

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func falling():
	sprite_2d.animation = "fall"
	shime_fall_anim.play("falloff")

func walk():
	sprite_2d.animation = "walk"

func jump():
	sprite_2d.animation = "jump"

func idle():
	sprite_2d.animation = "idle"

func DialogicSignal(argument:String):
	if argument == "playerflipon":
		sprite_2d.flip_h = false

	if argument == "playerflipoff":
		sprite_2d.flip_h = true

	if argument == "playerjump":
		cutscene_anim.play("jump")

	if argument == "playerjumptwo":
		cutscene_anim.play("jump_two")

	if argument == "playermoveon":
		cutscene_anim.play("walk_movingon")

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
	
