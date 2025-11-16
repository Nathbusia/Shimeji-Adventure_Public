extends CharacterBody2D

var speed = -238.0
var speed_r = 238.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var friend: AnimatedSprite2D = $Interfly/Friend
@onready var shooter: Sprite2D = $EmailShooter/Shooter

@onready var drop_email: Marker2D = $DropEmail
@onready var rescue_v_clips: AudioStreamPlayer2D = $VoiceClips/English/RescueVClips
@onready var rescue_v_clips_spa: AudioStreamPlayer2D = $VoiceClips/Spanish/RescueVClips_SPA
@onready var rescue_v_clips_fre: AudioStreamPlayer2D = $VoiceClips/French/RescueVClips_FRE
@onready var rescue_v_clips_ger: AudioStreamPlayer2D = $VoiceClips/German/RescueVClips_GER
@onready var rescue_v_clips_ita: AudioStreamPlayer2D = $VoiceClips/Italian/RescueVClips_ITA
@onready var rescue_v_clips_jpn: AudioStreamPlayer2D = $VoiceClips/Japanese/RescueVClips_JPN
@onready var dropping_timer: Timer = $DroppingTimer

var facing_right = false
var box_destroyed = false

@onready var email = preload("res://scenes/gameplaymechanics/world2/email_shooter_boss.tscn")
var email_path = ""

func _ready():
	match LanguageManager.language:
		"spanish":
			rescue_v_clips_spa.play()
		"french":
			rescue_v_clips_fre.play()
		"italian":
			rescue_v_clips_ita.play()
		"german":
			rescue_v_clips_ger.play()
		"japanese":
			rescue_v_clips_jpn.play()
		_:
			rescue_v_clips.play()

func _physics_process(_delta):
	
	if facing_right:
		velocity.x = speed_r
		friend.flip_h = false
	else:
		velocity.x = speed
	move_and_slide()

func drop_emailshoot():
	var scene = get_node("..") 
	var Email = email.instantiate()
	Email.global_position = drop_email.global_position
	scene.add_child(Email)
	shooter.visible = false


func _on_dropping_timer_timeout() -> void:
	drop_emailshoot()
	dropping_timer.stop()
