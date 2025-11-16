extends Node2D
@onready var friend: AnimatedSprite2D = $Friend
@onready var interfly_anim: AnimationPlayer = $InterflyAnim

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)

func DialogicSignal(argument:String):
	if argument == "greet":
		friend.play("greet")

	if argument == "flippedon":
		friend.flip_h = true

	if argument == "flippedoff":
		friend.flip_h = false


func _on_friend_animation_finished() -> void:
	friend.play("idle")
