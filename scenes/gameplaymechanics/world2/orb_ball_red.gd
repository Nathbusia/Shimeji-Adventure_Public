extends RigidBody2D

@onready var grab_hitbox: Area2D = $GrabHitbox

var got_inserted = false

#GrabbaleThings
@onready var shimeji_character_playable: CharacterBody2D = $"../ShimejiCharacter_Playable"
@onready var shimeji_character_playable_player_2: CharacterBody2D = $"../ShimejiCharacter_Playable_Player2"
@onready var shimeji_character_playable_player_3: CharacterBody2D = $"../ShimejiCharacter_Playable_Player3"
@onready var shimeji_character_playable_player_4: CharacterBody2D = $"../ShimejiCharacter_Playable_Player4"

#Player1
@onready var sprite_2d: AnimatedSprite2D = $"../ShimejiCharacter_Playable/Sprite2D"
@onready var carry_position_right: Marker2D = $"../ShimejiCharacter_Playable/CarryPositionRight"
@onready var carry_position_left: Marker2D = $"../ShimejiCharacter_Playable/CarryPositionLeft"

#Player2
@onready var sprite_2d_p2: AnimatedSprite2D = $"../ShimejiCharacter_Playable_Player2/Sprite2D"
@onready var carry_position_right_p2: Marker2D = $"../ShimejiCharacter_Playable_Player2/CarryPositionRight"
@onready var carry_position_left_p2: Marker2D = $"../ShimejiCharacter_Playable_Player2/CarryPositionLeft"

#Player3
@onready var sprite_2d_p3: AnimatedSprite2D = $"../ShimejiCharacter_Playable_Player3/Sprite2D"
@onready var carry_position_right_p3: Marker2D = $"../ShimejiCharacter_Playable_Player3/CarryPositionRight"
@onready var carry_position_left_p3: Marker2D = $"../ShimejiCharacter_Playable_Player3/CarryPositionLeft"

#Player4
@onready var sprite_2d_p4: AnimatedSprite2D = $"../ShimejiCharacter_Playable_Player4/Sprite2D"
@onready var carry_position_right_p4: Marker2D = $"../ShimejiCharacter_Playable_Player4/CarryPositionRight"
@onready var carry_position_left_p4: Marker2D = $"../ShimejiCharacter_Playable_Player4/CarryPositionLeft"

var picked = false
var picked_p2 = false
var picked_p3 = false
var picked_p4 = false

#Grabbable Codes
func _physics_process(delta: float) -> void:
	lock_rotation = false
	angular_velocity = 0
	linear_damp = 0.0
	if picked == true:
		if sprite_2d.flip_h == true:
			self.position = carry_position_right.global_position
		else:
			self.position = carry_position_left.global_position
		self.gravity_scale = 0.8
	
	if picked_p2 == true:
		if sprite_2d_p2.flip_h == true:
			self.position = carry_position_right_p2.global_position
		else:
			self.position = carry_position_left_p2.global_position
		self.gravity_scale = 0.8
	
	if picked_p3 == true:
		if sprite_2d_p3.flip_h == true:
			self.position = carry_position_right_p3.global_position
		else:
			self.position = carry_position_left_p3.global_position
		self.gravity_scale = 0.8
	
	if picked_p4 == true:
		if sprite_2d_p4.flip_h == true:
			self.position = carry_position_right_p4.global_position
		else:
			self.position = carry_position_left_p4.global_position
		self.gravity_scale = 0.8
	
	if shimeji_character_playable.is_damaged or shimeji_character_playable.is_dead and picked == true:
		linear_velocity =  Vector2()
		picked = false
		shimeji_character_playable.can_carry = true
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if shimeji_character_playable_player_2.is_damaged or shimeji_character_playable_player_2.is_dead and picked_p2 == true:
				linear_velocity =  Vector2()
				picked_p2 = false
				shimeji_character_playable_player_2.can_carry = true
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if shimeji_character_playable_player_3.is_damaged or shimeji_character_playable_player_3.is_dead and picked_p3 == true:
				linear_velocity =  Vector2()
				picked_p3 = false
				shimeji_character_playable_player_3.can_carry = true
		if ModeManager.multi_4players:
			if shimeji_character_playable_player_4.is_damaged or shimeji_character_playable_player_4.is_dead and picked_p4 == true:
				linear_velocity =  Vector2()
				picked_p4 = false
				shimeji_character_playable_player_4.can_carry = true

func _input(event):

#Player1
	if Input.is_action_pressed('grab'):
		var bodies = $GrabHitbox.get_overlapping_bodies()
		for body in bodies:
			if body.name == "ShimejiCharacter_Playable" and shimeji_character_playable.can_carry:
				picked = true
				shimeji_character_playable.can_carry = false
				shimeji_character_playable.pick_up_sfx.play()
				
	if Input.is_action_just_released('grab') and picked == true:
		picked = false
		shimeji_character_playable.can_carry = true
		if not shimeji_character_playable.is_on_floor():
			sprite_2d.play("throw_midair")
		else:
			sprite_2d.play("throw")
		if sprite_2d.flip_h == true:
			linear_velocity =  Vector2()
			apply_impulse(Vector2(390, -450), Vector2())
		else:
			linear_velocity =  Vector2()
			apply_impulse(Vector2(-390, -450), Vector2())
		shimeji_character_playable.throw_sfx.play()
		shimeji_character_playable.is_throwing = true

#Player2
	if Input.is_action_pressed('grab_p2'):
		var bodies = $GrabHitbox.get_overlapping_bodies()
		for body in bodies:
			if body.name == "ShimejiCharacter_Playable_Player2" and shimeji_character_playable_player_2.can_carry:
				picked_p2 = true
				shimeji_character_playable_player_2.can_carry = false
				shimeji_character_playable_player_2.pick_up_sfx.play()
	if Input.is_action_just_released('grab_p2') and picked_p2 == true:
		picked_p2 = false
		shimeji_character_playable_player_2.can_carry = true
		if not shimeji_character_playable_player_2.is_on_floor():
			sprite_2d_p2.play("throw_midair")
		else:
			sprite_2d_p2.play("throw")
		if sprite_2d_p2.flip_h == true:
			linear_velocity =  Vector2()
			apply_impulse(Vector2(390, -450), Vector2())
		else:
			linear_velocity =  Vector2()
			apply_impulse(Vector2(-390, -450), Vector2())
		shimeji_character_playable_player_2.throw_sfx.play()
		shimeji_character_playable_player_2.is_throwing = true


#Player3
	if Input.is_action_pressed('grab_p3'):
		var bodies = $GrabHitbox.get_overlapping_bodies()
		for body in bodies:
			if body.name == "ShimejiCharacter_Playable_Player3" and shimeji_character_playable_player_3.can_carry:
				picked_p3 = true
				shimeji_character_playable_player_3.can_carry = false
				shimeji_character_playable_player_3.pick_up_sfx.play()
	if Input.is_action_just_released('grab_p3') and picked_p3 == true:
		picked_p3 = false
		shimeji_character_playable_player_3.can_carry = true
		if not shimeji_character_playable_player_3.is_on_floor():
			sprite_2d_p3.play("throw_midair")
		else:
			sprite_2d_p3.play("throw")
		if sprite_2d_p3.flip_h == true:
			linear_velocity =  Vector2()
			apply_impulse(Vector2(390, -450), Vector2())
		else:
			linear_velocity =  Vector2()
			apply_impulse(Vector2(-390, -450), Vector2())
		shimeji_character_playable_player_3.throw_sfx.play()
		shimeji_character_playable_player_3.is_throwing = true
			
#Player4
	if Input.is_action_pressed('grab_p4'):
		var bodies = $GrabHitbox.get_overlapping_bodies()
		for body in bodies:
			if body.name == "ShimejiCharacter_Playable_Player4" and shimeji_character_playable_player_4.can_carry:
				picked_p4 = true
				shimeji_character_playable_player_4.can_carry = false
				shimeji_character_playable_player_4.pick_up_sfx.play()
	if Input.is_action_just_released('grab_p4') and picked_p4 == true:
		picked_p4 = false
		shimeji_character_playable_player_4.can_carry = true
		if not shimeji_character_playable_player_4.is_on_floor():
			sprite_2d_p4.play("throw_midair")
		else:
			sprite_2d_p4.play("throw")
		if sprite_2d_p4.flip_h == true:
			linear_velocity =  Vector2()
			apply_impulse(Vector2(390, -450), Vector2())
		else:
			linear_velocity =  Vector2()
			apply_impulse(Vector2(-390, -450), Vector2())
		shimeji_character_playable_player_4.throw_sfx.play()
		shimeji_character_playable_player_4.is_throwing = true

#Main Orb Ball Code

func _process(delta: float) -> void:
	if got_inserted:
		if picked:
			picked = false
			shimeji_character_playable.can_carry = true
		if picked_p2:
			picked_p2 = false
			shimeji_character_playable_player_2.can_carry = true
		if picked_p3:
			picked_p3 = false
			shimeji_character_playable_player_3.can_carry = true
		if picked_p4:
			picked_p4 = false
			shimeji_character_playable_player_4.can_carry = true
		queue_free()
