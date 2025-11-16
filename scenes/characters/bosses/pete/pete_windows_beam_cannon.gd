extends AnimatableBody2D
@onready var appear: AudioStreamPlayer2D = $SFX/Appear
@onready var adjust: AudioStreamPlayer2D = $SFX/Adjust
@onready var setsfx: AudioStreamPlayer2D = $SFX/Set
@onready var readysfx: AudioStreamPlayer2D = $SFX/Ready
@onready var shoot: AudioStreamPlayer2D = $SFX/Shoot

@onready var windows_anim: AnimationPlayer = $WindowsAnim
@onready var cannon_anim: AnimationPlayer = $CannonAnim

@onready var ball_spawn: Marker2D = $BallSpawn


#Smoke Stuff
@onready var particle = preload("res://scenes/characters/bosses/pete/pete_beamcannon_smoke.tscn")
@onready var ball = preload("res://scenes/characters/bosses/pete/pete_windows_beam_cannon_ball.tscn")

var particle_path = ""
var ball_path = ""

var is_facingleft = false

func play_appear():
	appear.play()

func play_adjust():
	adjust.play()

func play_set():
	adjust.stop()
	setsfx.play()

func play_ready():
	readysfx.play()

func play_shoot():
	shoot.play()
	shooting()

func start_attack():
	cannon_anim.play("cannon")

func close_window():
	windows_anim.play("popout")

func disappear():
	queue_free()

func shooting():
	var Particles = particle.instantiate()
	Particles.position = ball_spawn.position
	add_child(Particles)

	var Ball = ball.instantiate()
	Ball.position = ball_spawn.position
	add_child(Ball)
	if is_facingleft:
		Ball.facing_left = true
