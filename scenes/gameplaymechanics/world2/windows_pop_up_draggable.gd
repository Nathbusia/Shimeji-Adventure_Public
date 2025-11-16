extends AnimatableBody2D

var dragging = false
var player_interact = false
var got_sticked = false
var offset = Vector2(0,0)

func _process(delta):
	var overlapping_objects = $SticknodeDetect.get_overlapping_areas()
	
	for area in overlapping_objects:
		if area.get_parent().is_in_group("sticknode_group"):
			area.get_parent().freeze = true
	
	if dragging && !got_sticked:
		global_position = get_global_mouse_position() - offset
		print("Draggable Position (Global):" + str(global_position))

func _on_button_button_down() -> void:
	if !got_sticked:
		if !player_interact:
			dragging = true
			print("Draggable Held:" + str(dragging))
			offset = get_global_mouse_position() - global_position
	else:
		var overlapping_objects = $SticknodeDetect.get_overlapping_areas()
		
		for area in overlapping_objects:
			if area.get_parent().is_in_group("sticknode_group"):
				area.get_parent().stickrefuse()
				_on_button_button_up()
			else:
				dragging = true



func _on_button_button_up() -> void:
	dragging = false
	print("Draggable Held:" + str(dragging))
	print("Draggable Position (Global):" + str(global_position))

func gotsticked():
	dragging = false
	print("Draggable Held:" + str(dragging))

func _on_player_detect_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		player_interact = true
		print("Player 1 Touching it:" + str(player_interact))
		_on_button_button_up()
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		player_interact = true
		print("Player 2 Touching it:" + str(player_interact))
		_on_button_button_up()
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		player_interact = true
		print("Player 3 Touching it:" + str(player_interact))
		_on_button_button_up()
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		player_interact = true
		print("Player 4 Touching it:" + str(player_interact))
		_on_button_button_up()


func _on_player_detect_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		player_interact = false
		print("Player 1 Touching it:" + str(player_interact))
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		player_interact = false
		print("Player 2 Touching it:" + str(player_interact))
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		player_interact = false
		print("Player 3 Touching it:" + str(player_interact))
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		player_interact = false
		print("Player 4 Touching it:" + str(player_interact))
