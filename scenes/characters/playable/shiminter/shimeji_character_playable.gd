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
@onready var teleport: AudioStreamPlayer = $PlayerSFX/Teleport


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

var charname = "Shiminter"
var chardisplay = "Shiminter"
var charname_jpn = "冬しめじ"
var chardisplay_jpn = "冬しめじ"
var character = "shiminter"
var charcolour = "#A0EAFF"
var darkcolour = false

#Multiplayer Stuff
var is_player1 = false
var is_player2 = false
var is_player3 = false
var is_player4 = false
var inputplayer = ""
@onready var tag: AnimatedSprite2D = $Tag
@onready var player_position: AnimatedSprite2D = $PlayerPosition
@onready var shime_animation_player_multi: AnimationPlayer = $Shime_AnimationPlayer_Multi

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
var is_throwing = false

var idle_anim_counter: int = 0

var footsteps_frames : Array = [0, 2]
var crouch_frames : Array = [0]
var idle_wait_frames : Array = [1]
var end_taunt : Array = [5]

func bounce():
	if is_fastfalling:
		velocity.y = HIGHBOUNCE_VELOCITY
		sprite_2d.play("jump")
		slam_dash_bounce_timer.start()
	else:
		velocity.y = BOUNCE_VELOCITY

func bounce_fast():
	velocity.y = HIGHBOUNCE_VELOCITY

func _ready() -> void:
	match LanguageManager.language:
		"japanese":
			charname = "冬しめじ"
			chardisplay = "冬しめじ"
		_:
			return
			#All Languages share the same name.

func _physics_process(delta: float) -> void:
		if is_dead:
			return

		if ModeManager.is_multiplayer:
			if is_player1:
				inputplayer = MultiplayerManager.controls_p1
			if is_player2:
				inputplayer = MultiplayerManager.controls_p2
			if is_player3:
				inputplayer = MultiplayerManager.controls_p3
			if is_player4:
				inputplayer = MultiplayerManager.controls_p4
		else:
			inputplayer = MultiplayerManager.controls_p1

		if ModeManager.is_multiplayer:
			if charcolour == "#000000":
				tag.animation = "tags_dark"
			else:
				tag.self_modulate = Color(charcolour)
			if charcolour == "#000000":
				pass
			else:
				player_position.self_modulate = Color(charcolour)
		else:
			tag.hide()
			player_position.hide()

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
							sprite_2d.play("crouching_fast")
							is_waitidling = false
							is_throwing = false
						else:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.play("crouching")
							is_waitidling = false
							is_throwing = false
					elif can_carry == false:
						if is_running:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.play("carry_fast")
							is_waitidling = false
						else:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.play("carry")
							is_waitidling = false
					else:
						if is_running:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.play("run")
							is_sitting = false
							stuck_undertile = false
							is_waitidling = false
							is_throwing = false
						else:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.play("walk")
							is_sitting = false
							stuck_undertile = false
							is_waitidling = false
							is_throwing = false
				else:
					if is_sitting && !is_climbing && !is_damaged && !is_climbing_hori && !is_taunting && !is_waitidling:
						stand_shape.disabled = true
						crouch_shape.disabled = true
						sit_shape.disabled = false
						hori_climb_shape.disabled = true
						slam_dash_shape.disabled = true
						is_throwing = false
						sprite_2d.play("sit")
					elif can_carry == false && !is_climbing && !is_damaged && !is_climbing_hori && !is_taunting && !is_waitidling:
						stand_shape.disabled = false
						crouch_shape.disabled = true
						sit_shape.disabled = true
						hori_climb_shape.disabled = true
						slam_dash_shape.disabled = true
						sprite_2d.play("carry_idle")
						is_waitidling = false
					else:
						if !is_climbing && !is_damaged && !is_climbing_hori && !is_taunting && !is_waitidling && !is_throwing:
							stand_shape.disabled = false
							crouch_shape.disabled = true
							sit_shape.disabled = true
							hori_climb_shape.disabled = true
							slam_dash_shape.disabled = true
							sprite_2d.play("idle")
							stuck_undertile = false
							is_sitting = false
			
			# Add the gravity.
			if not is_on_floor() and not is_sitting and not is_climbing and not is_climbing_hori && !is_taunting && !is_waitidling:
				if not is_fastfalling:
					if is_damaged == true:
						velocity.y += gravity * delta
						sprite_2d.play("damaged")
					elif is_damaged == false:
						velocity.y += gravity * delta
						if is_damaged == true:
							sprite_2d.play("damaged")
							$Shime_AnimationPlayer_SlamDash.play("null")
						else:
							if !is_throwing:
								if can_carry == false:
									sprite_2d.play("carry_jump")
								else:
									sprite_2d.play("jump")

			# Same Code from Above but if the character is sitting.
			if not is_on_floor() and is_sitting and not is_climbing and not is_climbing_hori and can_carry:
				is_sitting = false
				if is_damaged == true:
					velocity.y += gravity * delta
					sprite_2d.play("damaged")
				elif is_damaged == false:
					velocity.y += gravity * delta
					if is_damaged == true:
						sprite_2d.play("damaged")
						$Shime_AnimationPlayer_SlamDash.play("null")
					else:
						sprite_2d.play("jump")
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
				if Input.is_action_pressed("sit" + inputplayer) && !is_incutscene:
					if is_running:
						velocity.y = RUNCLIMB_SPEED
						if velocity.y > 0:
							sprite_2d.play("climb_fast")
					else:
						velocity.y = CLIMB_SPEED
						if velocity.y > 0:
							sprite_2d.play("climb")
				elif Input.is_action_pressed("up" + inputplayer) && !is_incutscene:
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
				if Input.is_action_pressed("left" + inputplayer) && !is_incutscene:
					if is_running:
						velocity.x = -RUNCLIMB_SPEED
						if velocity.x < 0:
							sprite_2d.play("climb_horifast")
					else:
						velocity.x = -CLIMB_SPEED
						if velocity.x < 0:
							sprite_2d.play("climb_hori")
				elif Input.is_action_pressed("right" + inputplayer) && !is_incutscene:
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
				
				if Input.is_action_pressed("sit" + inputplayer) && !is_incutscene:
					stand_shape.disabled = false
					crouch_shape.disabled = true
					sit_shape.disabled = true
					hori_climb_shape.disabled = true
					slam_dash_shape.disabled = true
					is_climbing_hori = false
					
			# Handle jump.
			if Input.is_action_just_pressed("jump" + inputplayer) && !is_incutscene and can_jump and jump_count < max_jump and not is_sitting and not is_fastfalling:
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
			if Input.is_action_just_released("jump" + inputplayer) and jump_count < max_jump and not is_sitting and not is_fastfalling && !is_incutscene:
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
				if Input.is_action_just_pressed('sit' + inputplayer) and not is_on_floor() and not is_sitting && !is_incutscene:
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
						
				if Input.is_action_just_released('sit' + inputplayer) and not is_on_floor() and not is_sitting && !is_incutscene:
					return

			#Sitting Code
			if not is_climbing and not is_climbing_hori && can_carry:
				if Input.is_action_pressed('sit' + inputplayer) and is_on_floor() && !is_incutscene:
					is_sitting = true
					is_taunting = false
					if (velocity.x > 1 || velocity.x < -1) and is_sitting:
						if is_running:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							sprite_2d.play("crouching_fast")
						else:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							sprite_2d.play("crouching")
					else:
						stand_shape.disabled = true
						crouch_shape.disabled = true
						sit_shape.disabled = false
						sprite_2d.play("sit")
				if Input.is_action_just_released('sit' + inputplayer) and is_on_floor() && !is_incutscene:
					if not_undertile():
						is_sitting = false
						stuck_undertile = false
						sprite_2d.play("idle")
					else:
						if stuck_undertile != true:
							stand_shape.disabled = true
							crouch_shape.disabled = false
							sit_shape.disabled = true
							stuck_undertile = true

			if stuck_undertile && not_undertile():
				sprite_2d.play("idle")
				is_sitting = false
				stuck_undertile = false

			#Run Input Code
			if Input.is_action_pressed('run' + inputplayer) && !is_incutscene:
				is_running = true
			elif Input.is_action_just_released('run' + inputplayer) && !is_incutscene:
				is_running = false

			#Damaged Code
			if is_damaged == true and is_on_floor():
				velocity.y += gravity * delta
				sprite_2d.play("damaged")
				is_damaged = false
			
			#Taunting Code
			if Input.is_action_just_pressed("taunt" + inputplayer) && !is_incutscene && velocity.x == 0 && velocity.y == 0 && !is_sitting && !is_climbing && !is_climbing_hori && !is_fastfalling && !is_damaged:
				is_taunting = true
				if is_waitidling:
					is_waitidling = false
					idle_timer.stop()
					idle_wait_timer.stop()
				sprite_2d.play("taunt")
				taunt_sound.play()
				shime_animation_player.play("sit_out")
			
			#Check Player Tags Code (Only for Multiplayer)
			if Input.is_action_just_pressed("playertagcheck" + inputplayer) && ModeManager.is_multiplayer:
				$Shime_AnimationPlayer_Multi.play("playerPos")
			
			#Teleportation Code
			if Input.is_action_just_pressed("teleport" + inputplayer) && !is_incutscene && !is_sitting && !is_climbing && !is_climbing_hori && !is_fastfalling && !is_damaged:
				if ModeManager.is_multiplayer:
					if is_player1:
						teleport.play()
						game_manager.teleport_shimeji()
					if is_player2:
						teleport.play()
						game_manager.teleport_shimeji_player2()
					if is_player3:
						teleport.play()
						game_manager.teleport_shimeji_player3()
					if is_player4:
						teleport.play()
						game_manager.teleport_shimeji_player4()
				else:
					teleport.play()
					game_manager.teleport_shimeji()
			
			
			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			var direction := Input.get_axis("left" + inputplayer, "right" + inputplayer)
			var was_on_floor = is_on_floor()
			if direction && not is_taunting && not is_fastfalling && can_move && !is_incutscene:
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
			if direction !=0 && !is_climbing && !is_incutscene:
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
			sprite_2d.play("land")
			$Shime_AnimationPlayer_SlamDash.play("slam_land")
			sfx_slam_dash_fall.stop()
	
func start_slam_dash():
	is_fastfalling = true
	velocity = Vector2.ZERO
	sprite_2d.play("fall")
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
		
	sprite_2d.play("death")
	ouch.play()
	dead.play()
	has_respawned = false

func play_death_effect(name):
	is_dead = true
	$Shime_AnimationPlayer.play(name)
	
func respawn():
	is_dead = false
	play_damaged_effect("blink")
	shime_animation_player.play("RESET")
	is_invincible = true
	damaged_timer.start()
	if ModeManager.is_multiplayer:
		if is_player1:
			if game_manager.livesmax == 0:
				remove_from_group("players")
				hide()
				
			else:
				game_manager.respawn_shimeji()
				print("Respawning Player 1")
		if is_player2:
			if game_manager.livesmax_p2 == 0:
				remove_from_group("players")
				hide()
			else:
				game_manager.respawn_shimeji_player2()
				print("Respawning Player 2")
		if is_player3:
			if game_manager.livesmax_p3 == 0:
				remove_from_group("players")
				hide()
			else:
				game_manager.respawn_shimeji_player3()
				print("Respawning Player 3")
		if is_player4:
			if game_manager.livesmax_p4 == 0:
				remove_from_group("players")
				hide()
			else:
				game_manager.respawn_shimeji_player4()
				print("Respawning Player 4")
	else:
		game_manager.respawn_shimeji()
		print("Respawning Player")
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players && game_manager.livesmax == 0 && game_manager.livesmax_p2 == 0:
			game_manager.load_gameover()
		if ModeManager.multi_3players && game_manager.livesmax == 0 && game_manager.livesmax_p2 == 0 && game_manager.livesmax_p3 == 0:
			game_manager.load_gameover()
		if ModeManager.multi_4players && game_manager.livesmax == 0 && game_manager.livesmax_p2 == 0 && game_manager.livesmax_p3 == 0 && game_manager.livesmax_p4 == 0:
			game_manager.load_gameover()
	else:
		if game_manager.livesmax == 0:
			game_manager.load_gameover()

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
			sprite_2d.play("idle")
			is_waitidling = false
	elif sprite_2d.animation == "taunt":
		if sprite_2d.frame in end_taunt:
			sprite_2d.play("idle")
			is_taunting = false
	elif sprite_2d.animation == "throw":
		if sprite_2d.frame in idle_wait_frames:
			sprite_2d.play("idle")
			is_throwing = false
	elif sprite_2d.animation == "throw_midair":
		if sprite_2d.frame in idle_wait_frames:
			sprite_2d.play("jump")
			is_throwing = false
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
