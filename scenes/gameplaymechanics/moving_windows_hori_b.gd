extends Node2D

@onready var windows_pop_up: AnimatableBody2D = $WindowsPopUp

@export var offset = Vector2(-1220, 0)
@export var endoffset = Vector2(1220, 0)
@export var duration = 5.0

func _ready():
	start_tween()
	
func start_tween():
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(windows_pop_up, "position", offset, duration / 1.2)
	tween.tween_property(windows_pop_up, "position", endoffset, duration / 1.2)
