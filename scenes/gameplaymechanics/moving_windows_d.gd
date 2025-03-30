extends Node2D

@onready var windows_pop_up: AnimatableBody2D = $WindowsPopUp

@export var offset = Vector2(0, -320)
@export var duration = 8.0

func _ready():
	start_tween()
	
func start_tween():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(windows_pop_up, "position", offset, duration / 2.5)
	tween.tween_property(windows_pop_up, "position", Vector2.ZERO, duration / 2.5)
