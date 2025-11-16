extends Node

var config = ConfigFile.new()
const SETTINGS_FILE_PATH = "user://settings.ini"

func _ready():
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		config.set_value("keybinding", "sit", "Down")
		config.set_value("keybinding", "left", "Left")
		config.set_value("keybinding", "right", "Right")
		config.set_value("keybinding", "jump", "Space")
		config.set_value("keybinding", "run", "Shift")
		config.set_value("keybinding", "up", "Up")
		config.set_value("keybinding", "grab", "X")
		config.set_value("keybinding", "chat", "V")
		config.set_value("keybinding", "start", "Enter")
		config.set_value("keybinding", "pause", "Escape")
		config.set_value("keybinding", "dialogic_default_action", "Enter")
		config.set_value("keybinding", "taunt", "T")
		config.set_value("keybinding", "shoot", "Z")
		config.set_value("keybinding", "playertagcheck", "C")
		config.set_value("keybinding", "teleport", "")

		config.set_value("audio", "master_volume", 1.0)
		config.set_value("audio", "bgm_volume", 1.0)
		config.set_value("audio", "sfx_volume", 1.0)
		config.set_value("audio", "voices_volume", 1.0)
		config.set_value("audio", "ambience_volume", 1.0)

		config.set_value("video", "full_screen", false)
		config.set_value("video", "vsync", true)
		config.set_value("video", "resolution", 3)
		
		config.save(SETTINGS_FILE_PATH)
	else:
		config.load(SETTINGS_FILE_PATH)

func save_video_settings(key: String, value):
	config.set_value("video", key, value)
	config.save(SETTINGS_FILE_PATH)

func load_video_settings():
	var video_settings = {}
	for key in config.get_section_keys("video"):
		video_settings[key] = config.get_value("video", key)
	return video_settings

func save_audio_settings(key: String, value):
	config.set_value("audio", key, value)
	config.save(SETTINGS_FILE_PATH)

func load_audio_settings():
	var audio_settings = {}
	for key in config.get_section_keys("audio"):
		audio_settings[key] = config.get_value("audio", key)
	return audio_settings
	
func save_keybinding(action:StringName, event: InputEvent):
	var event_str
	if event is InputEventKey:
		event_str = OS.get_keycode_string(event.physical_keycode)
	elif event is InputEventMouseButton:
		event_str = "mouse_" + str(event.button_index)
	elif event is InputEventJoypadButton:
		event_str = "joypadbutton_" + str(event.button_index)
	elif event is InputEventJoypadMotion:
		event_str = "joypadmotion_" + str(event.axis) + "_" + str(event.axis_value)
	
	config.set_value("keybinding", action, event_str)
	config.save(SETTINGS_FILE_PATH)

func load_keybinding():
	var keybindings = {}
	var keys = config.get_section_keys("keybinding")
	var event = InputEvent
	for key in keys:
		var input_event
		var event_str = config.get_value("keybinding", key)
		var event_str_axis = config.get_value("keybinding", key, key)
		
		if event_str.contains("mouse_"):
			input_event = InputEventMouseButton.new()
			input_event.button_index = int(event_str.split("_")[1])
		elif event_str.contains("joypadbutton_"):
			input_event = InputEventJoypadButton.new()
			input_event.button_index = int(event_str.split("_")[1])
		elif event_str.contains("joypadmotion_"):
			input_event = InputEventJoypadMotion.new()
			input_event.axis = int(event_str.split("_")[1])
			input_event.axis_value = int(event_str_axis.split("joypadmotion_" + str(input_event.axis) + "_")[-1.00])
		else:
			input_event = InputEventKey.new()
			input_event.keycode = OS.find_keycode_from_string(event_str)
		keybindings[key] = input_event
	return keybindings
