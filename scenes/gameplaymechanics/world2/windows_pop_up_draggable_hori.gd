extends AnimatableBody2D

var dragging = false
var player_interact = false
var got_sticked = false
var of = Vector2(0,0)

var snap = 50

func _ready() -> void:
	var overlapping_objects = $SticknodeDetect.get_overlapping_areas()
	
	for area in overlapping_objects:
		if area.get_parent().is_in_group("sticknode_group"):
			area.get_parent().freeze = true

func _process(delta):

	if dragging && !got_sticked:
		global_position.x = get_global_mouse_position().x
		print("Draggable Position (Global):" + str(global_position))

func _on_button_button_down() -> void:
	if not got_sticked:
		dragging = true
		print("Draggable Held:" + str(dragging))
		of = get_global_mouse_position() - global_position
	else:
		var overlapping_objects = $SticknodeDetect.get_overlapping_areas()
		
		for area in overlapping_objects:
			if area.get_parent().is_in_group("sticknode_group"):
				area.get_parent().stickrefuse()
				dragging = false
			else:
				dragging = true


func _on_button_button_up() -> void:
	dragging = false
	print("Draggable Held:" + str(dragging))
	print("Draggable Position (Global):" + str(global_position))


func _on_sticknode_detect_area_entered(area: Area2D) -> void:
	if (area.name == "sticknode_group"):
		got_sticked = true
		area.freeze = true
