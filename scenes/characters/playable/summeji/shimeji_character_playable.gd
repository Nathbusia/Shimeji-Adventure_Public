extends CharacterBody2D

const SPEED = 300.0
const CLIMB_SPEED = 150.0
const CROUCH_SPEED = 100.0
const RUN_SPEED = 400.0
const RUNCROUCH_SPEED = 200.0
const RUNCLIMB_SPEED = 250.0
const JUMP_VELOCITY = -472.0
const DOUBLEJUMP_VELOCITY = -472.0
const BOUNCE_VELOCITY = -522.0
const HIGHBOUNCE_VELOCITY = -582.0
const FASTFALL_VELOCITY = 950.0
const OOFBOUNCE_VELOCITY = -250.0
const OOFPUSH_VELOCITY = -450.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var base_shape: CollisionShape2D = $BaseShape
@onready var sit_shape: CollisionShape2D = $SitShape
@onready var crouch_shape: CollisionShape2D = $CrouchShape
@onready var stand_shape: CollisionShape2D = $StandShape
@onready var hori_climb_shape: CollisionShape2D = $HoriClimbShape
@onready var slam_dash_shape: CollisionShape2D = $SlamDashShape
@onready var death_timer: Timer = $DeathTimer
@onready var damaged_timer: Timer = $DamagedTimer
@onready var fast_bounce_timer: Timer = $FastBounceTimer
@onready var jump_height_timer: Timer = $JumpHeightTimer
@onready var shime_animation_player_damaged: AnimationPlayer = $Shime_AnimationPlayer_Damaged
@onready var shime_animation_player: AnimationPlayer = $Shime_AnimationPlayer
@onready var shime_animation_player_slam_dash: AnimationPlayer = $Shime_AnimationPlayer_SlamDash
@onready var game_manager: GameManager = $"../../GameManager"
@onready var under_tile_left: RayCast2D = $UnderTile_Left
@onready var under_tile_right: RayCast2D = $UnderTile_Right
@onready var climbable_left: RayCast2D = $Climbable_Left
@onready var climbable_right: RayCast2D = $Climbable_Right
@onready var climbable_up: RayCast2D = $Climbable_Up


#SFX stuff
@onready var sfx_jump: AudioStreamPlayer = $PlayerSFX/Jump
@onready var sfx_double_jump: AudioStreamPlayer = $PlayerSFX/DoubleJump
@onready var sfx_sit_in: AudioStreamPlayer = $PlayerSFX/Sit_In
@onready var sfx_sit_out: AudioStreamPlayer = $PlayerSFX/Sit_Out
@onready var sfx_slam_dash_start: AudioStreamPlayer = $PlayerSFX/SlamDash_Start
@onready var sfx_slam_dash_fall: AudioStreamPlayer = $PlayerSFX/SlamDash_Fall
@onready var sfx_slam_dash_land: AudioStreamPlayer = $PlayerSFX/SlamDash_Land
@onready var sfx_slam_dash_end: AudioStreamPlayer = $PlayerSFX/SlamDash_End
@onready var sfx_move_crouching: AudioStreamPlayer = $PlayerSFX/Move_Crouching
@onready var footsteps_sounds: AudioStreamPlayer = $PlayerSFX/FootstepsSounds
@onready var ouch: AudioStreamPlayer = $PlayerSFX/Ouch
@onready var dead: AudioStreamPlayer = $PlayerSFX/Dead
@onready var pick_up_sfx: AudioStreamPlayer = $PlayerSFX/PickUpSFX
@onready var throw_sfx: AudioStreamPlayer = $PlayerSFX/ThrowSFX
@onready var grab_wall_sound: AudioStreamPlayer = $PlayerSFX/GrabWallSound
@onready var climbing_sounds: AudioStreamPlayer = $PlayerSFX/ClimbingSounds
@onready var taunt_sound: AudioStreamPlayer = $PlayerSFX/TauntSound

#UI Stuff
@export var score_charPortrait: CompressedTexture2D
@export var charIcon: CompressedTexture2D

#Character Exports
@export var characterfile: String

#Jumps and Gravity
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var max_jump = 2
var can_jump = false
var prevVelocity: Vector2 = Vector2.ZERO

#Idle Wait Timers
@onready var idle_timer: Timer = $IdleTimer
@onready var idle_wait_timer: Timer = $IdleWaitTimer

#SlamDashing
@onready var slam_dash_bounce_timer: Timer = $SlamDashBounceTimer

var charname = "Summeji"
var chardisplay = "Summeji"
var character = "summeji"
var charcolour = "#FFE465"
var darkcolour = false

var can_move = true
var is_sitting = false
var is_running = false
var is_damaged = false
var is_dead = false
var is_invincible = false
var stuck_undertile = false
var is_climbing = false
var is_climbing_hori = false
var can_carry = true
var is_holding = false
var is_fastfalling = false
var fastfalltimeout = false
var has_bounced = false
var has_jumped = false
var has_respawned = false
var level_complete = false
var is_incutscene = false
var is_taunting = false
var is_waitidling = false
var is_idle = false

var idle_anim_counter: int = 0

var footsteps_frames : Array = [0, 2]
var crouch_frames : Array = [0]
var idle_wait_frames : Array = [1]
var end_taunt : Array = [5]

func bounce():
	if is_fastfalling:
		velocity.y = HIGHBOUNCE_VELOCITY
		sprite_2d.animation = "jump"
		slam_dash_bounce_timer.start()
	else:
		velocity.y = BOUNCE_VELOCITY

func bounce_fast():
	velocity.y = HIGHBOUNCE_VELOCITY

func _ready() -> void:
	Dialogic.timeline_started.connect(set_physics_process.bind(false))
	Dialogic.timeline_started.connect(set_process_input.bind(false))
	Dialogic.timeline_ended.connect(set_physics_process.bind(true))
	Dialogic.timeline_ended.connect(set_process_input.bind(true))

func _physics_process(delta: float) -> void:
		if is_dead:
			return
		
		#Animations
		if not level_complete:
			if not is_fastfalling:
				if (velocity.x > 1 || velocity.x < -1) && !is_climbing_hori:
					if is_sitting:
						if is_running:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.animation = "crouching_fast"
						else:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.animation = "crouching"
					elif can_carry == false:
						if is_running:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.animation = "carry_fast"
							is_waitidling = false
						else:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.animation = "carry"
							is_waitidling = false
					else:
						if is_running:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.animation = "run"
							is_sitting = false
							stuck_undertile = false
							is_waitidling = false
						else:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.animation = "walk"
							is_sitting = false
							stuck_undertile = false
							is_waitidling = false
				else:
					if is_sitting && !is_climbing && !is_damaged && !is_climbing_hori && !is_taunting && !is_waitidling:
						stand_shape.disabled = true
						crouch_shape.disabled = true
						sit_shape.disabled = false
						hori_climb_shape.disabled = true
						slam_dash_shape.disabled = true
						sprite_2d.animation = "sit"
					elif can_carry == false && !is_climbing && !is_damaged && !is_climbing_hori && !is_taunting && !is_waitidling:
						stand_shape.disabled = false
						crouch_shape.disabled = true
						sit_shape.disabled = true
						hori_climb_shape.disabled = true
						slam_dash_shape.disabled = true
						sprite_2d.animation = "carry_idle"
						is_waitidling = false
					else:
						if !is_climbing && !is_damaged && !is_climbing_hori && !is_taunting && !is_waitidling:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.animation = "idle"
							stuck_undertile = false
							is_sitting = false
			
			# Add the gravity.
			if not is_on_floor() and not is_sitting and not is_climbing and not is_climbing_hori && !is_taunting && !is_waitidling:
				if not is_fastfalling:
					if is_damaged == true:
						velocity.y += gravity * delta
						sprite_2d.animation = "damaged"
					elif is_damaged == false:
						velocity.y += gravity * delta
						if is_damaged == true:
							sprite_2d.animation = "damaged"
							$Shime_AnimationPlayer_SlamDash.play("null")
						else:
							if can_carry == false:
								sprite_2d.animation = "carry_jump"
							else:
								sprite_2d.animation = "jump"

			# Same Code from Above but if the character is sitting.
			if not is_on_floor() and is_sitting and not is_climbing and not is_climbing_hori and can_carry:
				is_sitting = false
				if is_damaged == true:
					velocity.y += gravity * delta
					sprite_2d.animation = "damaged"
				elif is_damaged == false:
					velocity.y += gravity * delta
					if is_damaged == true:
						sprite_2d.animation = "damaged"
						$Shime_AnimationPlayer_SlamDash.play("null")
					else:
						sprite_2d.animation = "jump"
					is_waitidling = false
					idle_wait_timer.stop()

			# Same Code from Above Above but if the character is performing a Slam Dash.
			if not is_on_floor() and not is_sitting and not is_climbing and not is_climbing_hori and is_fastfalling and can_carry:
				if is_damaged == true:
					velocity.y += gravity * delta
					sprite_2d.play("damaged")
					$Shime_AnimationPlayer_SlamDash.play("null")

			# Same Code from Above Above Above but if the character is taunting.
			if not is_on_floor() and is_taunting and not is_sitting and not is_climbing and not is_climbing_hori and not is_fastfalling and can_carry:
				if is_damaged == true:
					is_taunting = false
					velocity.y += gravity * delta
					sprite_2d.play("damaged")
					$Shime_AnimationPlayer_SlamDash.play("null")

			# You get the memo by now... Right?
			if not is_on_floor() and not is_sitting and is_climbing or is_climbing_hori and can_carry:
				if is_damaged == true:
					velocity.y += gravity * delta
					sprite_2d.play("damaged")

			if is_on_floor() and is_damaged == true:
				velocity.y += gravity * delta
				sprite_2d.play("damaged")

			if is_on_floor() and !can_jump:
				can_jump = true

			if is_on_floor() and jump_count != 0:
				jump_count = 0

			#Climbing Code
			if is_climbing && !is_climbing_hori && can_carry:
				if Input.is_action_pressed("sit"):
					if is_running:
						velocity.y = RUNCLIMB_SPEED
						if velocity.y > 0:
							sprite_2d.play("climb_fast")
					else:
						velocity.y = CLIMB_SPEED
						if velocity.y > 0:
							sprite_2d.play("climb")
				elif Input.is_action_pressed("up"):
					if is_running:
						velocity.y = -RUNCLIMB_SPEED
						if velocity.y < 0:
							sprite_2d.play("climb_fast")
					else:
						velocity.y = -CLIMB_SPEED
						if velocity.y < 0:
							sprite_2d.play("climb")
				else:
					velocity.y = 0
					sprite_2d.play("climb_idle")

			if is_climbing_hori && !is_climbing && can_carry:
				stand_shape.disabled = true
				crouch_shape.disabled = true
				sit_shape.disabled = true
				hori_climb_shape.disabled = false
				slam_dash_shape.disabled = true
				if Input.is_action_pressed("left"):
					if is_running:
						velocity.x = -RUNCLIMB_SPEED
						if velocity.x < 0:
							sprite_2d.play("climb_horifast")
					else:
						velocity.x = -CLIMB_SPEED
						if velocity.x < 0:
							sprite_2d.play("climb_hori")
				elif Input.is_action_pressed("right"):
					if is_running:
						velocity.x = RUNCLIMB_SPEED
						if velocity.x > 0:
							sprite_2d.play("climb_horifast")
					else:
						velocity.x = CLIMB_SPEED
						if velocity.x > 0:
							sprite_2d.play("climb_hori")
				else:
					velocity.y = 0
					sprite_2d.play("climb_horiidle")
				
				if Input.is_action_pressed("sit"):
					stand_shape.disabled = false
					crouch_shape.disabled = true
					sit_shape.disabled = true
					hori_climb_shape.disabled = true
					slam_dash_shape.disabled = true
					is_climbing_hori = false
					
			# Handle jump.
			if Input.is_action_just_pressed("jump") and can_jump and jump_count < max_jump and not is_sitting and not is_fastfalling:
				is_taunting = false
				if is_waitidling:
					sprite_2d.play("jump")
					is_waitidling = false
					idle_wait_timer.stop()
				if is_climbing:
					is_climbing = false
				jump_count += 1
				shime_animation_player.play("jump")
				if !is_idle:
					pass #So it won't repeat
				is_idle = false
				idle_timer.stop()
				idle_wait_timer.stop()
				print("No longer idling")
				idle_anim_counter = 0 
				if jump_count == 2:
					sfx_double_jump.play()
					velocity.y = DOUBLEJUMP_VELOCITY
					can_jump = false
				else:
					velocity.y = JUMP_VELOCITY
					sfx_jump.play()
			if Input.is_action_just_released("jump") and jump_count < max_jump and not is_sitting and not is_fastfalling:
				velocity.y *= 0.1
			if not is_on_floor():
				velocity.y = lerp(prevVelocity.y, velocity.y, 0.95)
			
			if not is_on_floor():
				velocity.x = lerp(prevVelocity.x, velocity.x, 0.2)
			
			if abs(velocity.y) < 50 && not is_fastfalling && not is_on_floor:
				gravity *= 1.05
			else:
				gravity = 1120
			
			prevVelocity = velocity
			
			# Fast Fall Code
			if not is_climbing and not is_climbing_hori && can_carry:
				if Input.is_action_just_pressed('sit') and not is_on_floor() and not is_sitting:
					if is_fastfalling:
						return #So you won't be able to press it again.
					else:
						stand_shape.disabled = true
						crouch_shape.disabled = true
						sit_shape.disabled = true
						hori_climb_shape.disabled = true
						slam_dash_shape.disabled = false
						start_slam_dash()
						sfx_slam_dash_start.play()
						
				if Input.is_action_just_released('sit') and not is_on_floor() and not is_sitting:
					return

			#Sitting Code
			if not is_climbing and not is_climbing_hori && can_carry:
				if Input.is_action_pressed('sit') and is_on_floor():
					is_sitting = true
					is_taunting = false
					if (velocity.x > 1 || velocity.x < -1) and is_sitting:
						if is_running:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							sprite_2d.animation = "crouching_fast"
						else:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							sprite_2d.animation = "crouching"
					else:
						stand_shape.disabled = true
						crouch_shape.disabled = true
						sit_shape.disabled = false
						sprite_2d.animation = "sit"
				if Input.is_action_just_released('sit') and is_on_floor():
					if not_undertile():
						is_sitting = false
						stuck_undertile = false
						sprite_2d.animation = "idle"
					else:
						if stuck_undertile != true:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							stuck_undertile = true

			if stuck_undertile && not_undertile():
				sprite_2d.animation = "idle"
				is_sitting = false
				stuck_undertile = false

			#Run Input Code
			if Input.is_action_pressed('run'):
				is_running = true
			elif Input.is_action_just_released('run'):
				is_running = false

			#Damaged Code
			if is_damaged == true and is_on_floor():
				velocity.y += gravity * delta
				sprite_2d.play("damaged")
				is_damaged = false
			
			#Taunting Code
			if Input.is_action_just_pressed("taunt") && velocity.x == 0 && velocity.y == 0 && !is_sitting && !is_climbing && !is_climbing_hori && !is_fastfalling && !is_damaged:
				is_taunting = true
				if is_waitidling:
					is_waitidling = false
					idle_timer.stop()
					idle_wait_timer.stop()
				sprite_2d.animation = "taunt"
				taunt_sound.play()
				shime_animation_player.play("sit_out")
			
			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			var direction := Input.get_axis("left", "right")
			var was_on_floor = is_on_floor()
			if direction && not is_taunting && not is_fastfalling && can_move:
				if is_sitting:
					if is_running:
						velocity.x = move_toward(velocity.x, direction * RUNCROUCH_SPEED, 45)
					else:
						velocity.x = move_toward(velocity.x, direction * CROUCH_SPEED, 50)
				else:
					if is_running:
						velocity.x = move_toward(velocity.x, direction * RUN_SPEED, 40)
					else:
						velocity.x = move_toward(velocity.x, direction * SPEED, 50)
			else:
				if is_sitting:
					velocity.x = move_toward(velocity.x, 0, 45)
				else:
					velocity.x = move_toward(velocity.x, 0, 40)
					
			move_and_slide()
			for i in get_slide_collision_count(): slam_dash_land(get_slide_collision(i))
			if direction !=0 && !is_climbing:
				sprite_2d.flip_h = direction > 0
			
func not_undertile():
	var result = !under_tile_left.is_colliding() && !under_tile_right.is_colliding()
	return result

func slam_dash_land(collision: KinematicCollision2D):
	if is_on_floor() and is_fastfalling:
		if has_bounced:
			is_fastfalling = false
			can_move = true
		elif is_damaged:
			sprite_2d.play("damaged")
			$Shime_AnimationPlayer_SlamDash.play("null")
		else:
			sprite_2d.animation = "land"
			$Shime_AnimationPlayer_SlamDash.play("slam_land")
			sfx_slam_dash_fall.stop()
	
func start_slam_dash():
	is_fastfalling = true
	velocity = Vector2.ZERO
	sprite_2d.animation = "fall"
	$Shime_AnimationPlayer_SlamDash.play("slam_intro")

func slam_dash():
	velocity = Vector2(0, FASTFALL_VELOCITY)
	$Shime_AnimationPlayer_SlamDash.play("slam_fall")

func end_slam_dash():
	stand_shape.disabled = false
	crouch_shape.disabled = true
	sit_shape.disabled = true
	hori_climb_shape.disabled = true
	slam_dash_shape.disabled = true
	is_fastfalling = false

func levelcompleted():
	level_complete = true

func get_hurt():
	velocity.y = OOFBOUNCE_VELOCITY
	if sprite_2d.flip_h == false:
		velocity.x = -OOFPUSH_VELOCITY
	else:
		velocity.x = OOFPUSH_VELOCITY
	ouch.play()

func hurt_invincible():
	is_invincible = true
	damaged_timer.start()

func play_damaged_effect(name):
	is_damaged = true
	$Shime_AnimationPlayer_Damaged.play(name)

func death():
	if is_dead:
		return
		
	sprite_2d.animation = "death"
	ouch.play()
	dead.play()
	has_respawned = false

func play_death_effect(name):
	is_dead = true
	$Shime_AnimationPlayer.play(name)
	
func respawn():
	if game_manager.livesmax == 0:
		game_manager.load_gameover()
	else:
		is_dead = false
		play_damaged_effect("blink")
		shime_animation_player.play("RESET")
		is_invincible = true
		damaged_timer.start()
		game_manager.respawn_shimeji()

func _on_damaged_timer_timeout() -> void:
	is_invincible = false
	shime_animation_player.queue("null")
	
func _on_fast_bounce_timer_timeout() -> void:
	has_bounced = false

func _on_sprite_2d_frame_changed() -> void:
	if sprite_2d.animation == "walk" or sprite_2d.animation == "run" or sprite_2d.animation == "carry" or sprite_2d.animation == "carry_fast":
		if sprite_2d.frame in footsteps_frames:
			footsteps_sounds.play()
			sfx_move_crouching.stop()
	elif sprite_2d.animation == "crouching" or sprite_2d.animation == "crouching_fast":
		if sprite_2d.frame in crouch_frames:
			sfx_move_crouching.play()
			footsteps_sounds.stop()
	elif sprite_2d.animation == "climb" or sprite_2d.animation == "climb_fast" or sprite_2d.animation == "climb_hori" or sprite_2d.animation == "climb_horifast":
		if sprite_2d.frame in footsteps_frames:
			climbing_sounds.play()
			sfx_move_crouching.stop()
	elif sprite_2d.animation == "idle_dangling_start":
		if sprite_2d.frame in idle_wait_frames:
			sprite_2d.animation = "idle_dangling_loop"
	elif sprite_2d.animation == "idle_dangling_end":
		if sprite_2d.frame in idle_wait_frames:
			sprite_2d.animation = "idle"
			is_waitidling = false
	elif sprite_2d.animation == "taunt":
		if sprite_2d.frame in end_taunt:
			sprite_2d.animation = "idle"
			is_taunting = false
	else:
		footsteps_sounds.stop()
		sfx_move_crouching.stop()
	
	if sprite_2d.animation == "idle" || sprite_2d.animation == "idle_dangling_start" || sprite_2d.animation == "idle_dangling_loop" || sprite_2d.animation == "idle_dangling_end":
		if !velocity && is_on_floor() and not is_sitting and not is_climbing and not is_climbing_hori && !is_taunting && !is_waitidling:
			if is_idle:
				return #So it won't repeat
			is_idle = true
			if can_carry:
				idle_timer.start()
				print("Waiting time is ticking!")
			print("Now idling")
	else:
		if !is_idle:
			return #So it won't repeat
		is_idle = false
		idle_timer.stop()
		idle_wait_timer.stop()
		print("No longer idling")
		idle_anim_counter = 0
	
func _on_idle_timer_timeout() -> void:
	is_waitidling = true
	sprite_2d.play("idle_dangling_start")
	idle_wait_timer.start()
	print("I'm waiting!! Let's move already!")


func _on_idle_wait_timer_timeout() -> void:
	sprite_2d.play("idle_dangling_end")


func _on_slam_dash_bounce_timer_timeout() -> void:
	end_slam_dash()
	$Shime_AnimationPlayer_SlamDash.play("null")
	slam_dash_bounce_timer.stop()
