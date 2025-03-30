extends RigidBody2D

@onready var area_2d: Area2D = $Area2D
@onready var shimeji_character_playable: CharacterBody2D = $"../ShimejiCharacter_Playable"
@onready var sprite_2d: AnimatedSprite2D = $"../ShimejiCharacter_Playable/Sprite2D"
@onready var carry_position_right: Marker2D = $"../ShimejiCharacter_Playable/CarryPositionRight"
@onready var carry_position_left: Marker2D = $"../ShimejiCharacter_Playable/CarryPositionLeft"


var picked = false
 

func _physics_process(delta: float) -> void:
	lock_rotation = true
	if picked == true:
		if sprite_2d.flip_h == true:
			self.position = carry_position_right.global_position
		else:
			self.position = carry_position_left.global_position

func _input(event):
	if Input.is_action_pressed('grab'):
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "ShimejiCharacter_Playable" and shimeji_character_playable.can_carry:
				picked = true
				shimeji_character_playable.can_carry = false
				shimeji_character_playable.pick_up_sfx.play()
	if Input.is_action_just_released('grab') and picked == true:
		picked = false
		shimeji_character_playable.can_carry = true
		if not shimeji_character_playable.is_on_floor():
			sprite_2d.animation = "throw_midair"
		else:
			sprite_2d.animation = "throw"
		if sprite_2d.flip_h == true:
			apply_impulse(Vector2(390, -450), Vector2())
			shimeji_character_playable.throw_sfx.play()
		else:
			apply_impulse(Vector2(-390, -450), Vector2())
			shimeji_character_playable.throw_sfx.play()
	if Input.is_action_just_released('grab') and picked == true:
		picked = false
		shimeji_character_playable.can_carry = true
		if not shimeji_character_playable.is_on_floor():
			sprite_2d.animation = "throw_midair"
		else:
			sprite_2d.animation = "throw"
		if sprite_2d.flip_h == true:
			apply_impulse(Vector2(360, -350), Vector2())
			shimeji_character_playable.throw_sfx.play()
		else:
			apply_impulse(Vector2(-150, -350), Vector2())
			shimeji_character_playable.throw_sfx.play()
		
		
