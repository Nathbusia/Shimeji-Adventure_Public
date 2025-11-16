extends Node2D

@onready var cutscene_anim: AnimationPlayer = $CutsceneAnim
@onready var sfx_move_crouching: AudioStreamPlayer = $PlayerSFX/Move_Crouching
@onready var footsteps_sounds: AudioStreamPlayer = $PlayerSFX/FootstepsSounds
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var shime_fall_anim: AnimationPlayer = $ShimeFallAnim
@onready var taunt_sound: AudioStreamPlayer = $PlayerSFX/TauntSound

@export var has_specialanim = false

var footsteps_frames : Array = [0, 2]
var crouch_frames : Array = [0]

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func falling():
	sprite_2d.play("fall")
	shime_fall_anim.play("falloff")

func walk():
	sprite_2d.play("walk")

func jump():
	sprite_2d.play("jump")

func idle():
	sprite_2d.play("idle")

func sit():
	sprite_2d.play("sit")

func taunt():
	sprite_2d.play("taunt")
	taunt_sound.play()

#Special Animations (If your Custom Characters has a different animation than the Original.

func specialanim_1(): #Special Animation 1: Something to do with talking normally.
	#Place your Custom Animation for Special Animation 1 here. (Like AnimatedSprite, or AnimationPlayer.)
	if has_specialanim:
		pass

func specialanim_2(): #Special Animation 2: Something to do with a good agreement (Like a Thumb up for example).
	#Place your Custom Animation for Special Animation 2 here. (Like AnimatedSprite, or AnimationPlayer.)
	if has_specialanim:
		pass

func specialanim_3(): #Special Animation 3: Something to do with being shock or surprised.
	#Place your Custom Animation for Special Animation 3 here. (Like AnimatedSprite, or AnimationPlayer.)
	if has_specialanim:
		pass

func specialanim_4(): #Special Animation 4: Something to do with War Cry, or ready for battle.
	#Place your Custom Animation for Special Animation 4 here. (Like AnimatedSprite, or AnimationPlayer.)
	if has_specialanim:
		pass

func specialanim_5(): #Special Animation 5: Something to do with thinking.
	#Place your Custom Animation for Special Animation 5 here. (Like AnimatedSprite, or AnimationPlayer.)
	if has_specialanim:
		pass

func specialanim_6(): #Special Animation 6: Something do with Victory! Or could be anything else.
	#Place your Custom Animation for Special Animation 6 here. (Like AnimatedSprite, or AnimationPlayer.)
	if has_specialanim:
		pass

func DialogicSignal(argument:String):
	if argument == "playerflipon":
		sprite_2d.flip_h = false

	if argument == "playerflipoff":
		sprite_2d.flip_h = true

	if argument == "playerjump":
		if has_specialanim:
			pass
		else:
			cutscene_anim.play("jump")

	if argument == "playerjumptwo":
		if has_specialanim:
			pass
		else:
			cutscene_anim.play("jump_two")

	if argument == "playermoveon":
		cutscene_anim.play("walk_movingon")

	if argument == "specialanim_1":
		specialanim_1()

	if argument == "specialanim_2":
		specialanim_2()

	if argument == "specialanim_3":
		specialanim_3()

	if argument == "specialanim_4":
		specialanim_4()

	if argument == "specialanim_5":
		specialanim_5()

	if argument == "specialanim_6":
		specialanim_6()

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
	
