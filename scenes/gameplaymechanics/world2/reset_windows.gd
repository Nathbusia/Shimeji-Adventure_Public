extends TextureButton
@onready var button_click: AudioStreamPlayer2D = $ButtonClick
@onready var button_activate: AudioStreamPlayer2D = $ButtonActivate

var reset = false

func _on_pressed() -> void:
	button_click.play()
	button_activate.play()
	reset = true
	print("Resetting:" + str(reset))
