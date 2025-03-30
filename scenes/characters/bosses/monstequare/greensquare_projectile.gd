extends RigidBody2D

var speed = -238.0

@onready var area_2d: Area2D = $Area2D
@onready var game_manager: GameManager = $"../../GameManager"
@onready var shimeji_character_playable: CharacterBody2D = $"../ShimejiCharacter_Playable"
@onready var sprite_2d: AnimatedSprite2D = $"../ShimejiCharacter_Playable/Sprite2D"
@onready var carry_position_right: Marker2D = $"../ShimejiCharacter_Playable/CarryPositionRight"
@onready var carry_position_left: Marker2D = $"../ShimejiCharacter_Playable/CarryPositionLeft"
@onready var thrown_time_out: Timer = $ThrownTimeOut
@onready var lifespan: Timer = $Lifespan
@onready var box_life: AnimationPlayer = $BoxLife


var picked = false
var has_thrown = false

func _physics_process(delta: float) -> void:
	lock_rotation = true
	if picked == true:
		if sprite_2d.flip_h == true:
			self.position = carry_position_right.global_position
		else:
			self.position = carry_position_left.global_position
	else:
		if has_thrown == false:
			gravity_scale = 0
			linear_velocity.x = speed

func _input(event):
	if Input.is_action_pressed('grab'):
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "ShimejiCharacter_Playable" and shimeji_character_playable.can_carry:
				picked = true
				box_life.play("RESET")
				lifespan.stop()
				has_thrown = true
				shimeji_character_playable.can_carry = false
				shimeji_character_playable.pick_up_sfx.play()
	if Input.is_action_just_released('grab') and picked == true:
		picked = false
		linear_velocity.x = 0
		gravity_scale = 1
		lifespan.start()
		box_life.play("default")
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
		
		


func _on_lifespan_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node) -> void:
	if body.name == "Monstequare":
		if game_manager.boss_health == 1:
			body.boss_defeated()
			queue_free()
		else:
			body.boss_took_damaged()
			queue_free()
