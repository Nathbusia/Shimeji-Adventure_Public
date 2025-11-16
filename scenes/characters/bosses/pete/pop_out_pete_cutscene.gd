extends AnimatableBody2D
@onready var eyes: AnimatedSprite2D = $PeteBody/Eyes
@onready var moustache: AnimatedSprite2D = $PeteBody/Moustache
@onready var mouth: AnimatedSprite2D = $PeteBody/Mouth
@onready var pete_anim: AnimationPlayer = $PeteAnim
@onready var talk_timer: Timer = $Timers/TalkTimer

var is_cocky = false
var is_smirky = false
var is_normal = false
var is_surprised = false
var is_unimpress = false
var is_evil = false
var is_laughing = false

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	
func DialogicSignal(argument:String):
	if argument == "pete_cockytalk":
		pete_anim.play("talk_cocky")
		mouth.play("talk")
		talk_timer.start()
		is_cocky = true
		is_smirky = false
		is_normal = false
		is_surprised = false
		is_unimpress = false
		is_evil = false
		is_laughing = false
	
	if argument == "pete_smirktalk":
		pete_anim.play("talk_normal")
		eyes.play("smirk")
		mouth.play("talk")
		talk_timer.start()
		is_cocky = false
		is_smirky = true
		is_normal = false
		is_surprised = false
		is_unimpress = false
		is_evil = false
		is_laughing = false

	if argument == "pete_surprisedtalk":
		pete_anim.play("summon")
		eyes.play("laugh")
		mouth.play("talk")
		talk_timer.start()
		is_cocky = false
		is_smirky = false
		is_normal = false
		is_surprised = true
		is_unimpress = false
		is_evil = false
		is_laughing = false

	if argument == "pete_normaltalk":
		pete_anim.play("talk_normal")
		eyes.play("idle")
		mouth.play("talk")
		talk_timer.start()
		is_cocky = false
		is_smirky = false
		is_normal = true
		is_surprised = false
		is_unimpress = false
		is_evil = false
		is_laughing = false

	if argument == "pete_unimpress":
		pete_anim.play("talk_normal")
		eyes.play("umimpress")
		mouth.play("unimpress")
		is_cocky = false
		is_smirky = false
		is_normal = false
		is_surprised = false
		is_unimpress = true
		is_evil = false
		is_laughing = false

	if argument == "pete_eviltalk":
		pete_anim.play("summon")
		eyes.play("summon")
		mouth.play("talk")
		talk_timer.start()
		is_cocky = false
		is_smirky = false
		is_normal = false
		is_surprised = false
		is_unimpress = false
		is_evil = true
		is_laughing = false

	if argument == "pete_beginfight":
		pete_anim.play("laughter")
		eyes.play("laugh")
		mouth.play("talk")
		talk_timer.start()
		is_cocky = false
		is_smirky = false
		is_normal = false
		is_surprised = false
		is_unimpress = false
		is_evil = false
		is_laughing = true

func _on_talk_timer_timeout() -> void:
	if is_cocky || is_smirky || is_evil:
		mouth.play("attack")
	elif is_normal:
		mouth.play("idle")
	elif is_surprised:
		mouth.play("smile")
	elif is_laughing:
		mouth.play("laugh")
	else:
		mouth.play("idle")
	talk_timer.stop()
