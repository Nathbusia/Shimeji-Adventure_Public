extends TextureButton
@onready var button_click: AudioStreamPlayer2D = $ButtonClick

var activate = false

func _on_pressed() -> void:
	button_click.play()
	activate = true
	disabled = true
