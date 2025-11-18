extends Control
#Settings Stuff
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover
@onready var sfx_test: AudioStreamPlayer2D = $Volume_Resolution/VolumeSetting/SFXTest
@onready var voice_test: AudioStreamPlayer2D = $Volume_Resolution/VolumeSetting/VoiceTest
@onready var toggled_on_sfx: AudioStreamPlayer2D = $Volume_Resolution/Resolution/ToggledOn
@onready var toggled_off_sfx: AudioStreamPlayer2D = $Volume_Resolution/Resolution/ToggledOff

@onready var volume_resolution: Panel = $Volume_Resolution
@onready var controls: Panel = $Controls
@onready var controls_player_1: Panel = $Controls/Controls_Player1
@onready var controls_player_2: Panel = $Controls/Controls_Player2
@onready var controls_player_3: Panel = $Controls/Controls_Player3
@onready var controls_player_4: Panel = $Controls/Controls_Player4
@onready var miscellaneous: Panel = $Miscellaneous

@onready var control_player_1: TextureButton = $Controls/Control_Player1
@onready var control_player_2: TextureButton = $Controls/Control_Player2
@onready var control_player_3: TextureButton = $Controls/Control_Player3
@onready var control_player_4: TextureButton = $Controls/Control_Player4


@onready var volume_master: HSlider = $Volume_Resolution/VolumeSetting/VolumeMaster
@onready var volume_master_bgm: HSlider = $Volume_Resolution/VolumeSetting/VolumeMaster_BGM
@onready var volume_master_sfx: HSlider = $Volume_Resolution/VolumeSetting/VolumeMaster_SFX
@onready var volume_master_voices: HSlider = $Volume_Resolution/VolumeSetting/VolumeMaster_Voices
@onready var volume_master_ambience: HSlider = $Volume_Resolution/VolumeSetting/VolumeMaster_Ambience

@onready var check_button: CheckButton = $Volume_Resolution/Resolution/CheckButton
@onready var vsync_button: CheckButton = $Volume_Resolution/Resolution/VsyncButton
@onready var resolutons_option: OptionButton = $Volume_Resolution/Resolution/ResolutonsOption

@onready var check_mods: CheckButton = $Miscellaneous/CheckMods
@onready var misc_tab: TextureButton = $Misc_Tab

#Language Stuff
@onready var english_button: TextureButton = $LanguageSelect/LanguageButtons/EnglishButton
@onready var spanish_button: TextureButton = $LanguageSelect/LanguageButtons/SpanishButton
@onready var french_button: TextureButton = $LanguageSelect/LanguageButtons/FrenchButton
@onready var italian_button: TextureButton = $LanguageSelect/LanguageButtons/ItalianButton
@onready var german_button: TextureButton = $LanguageSelect/LanguageButtons/GermanButton
@onready var japanese_button: TextureButton = $LanguageSelect/LanguageButtons/JapaneseButton


func _ready():
	if !ModeManager.in_gameplay:
		DiscordRPC.state = "Selecting a Language"
		DiscordRPC.details = ""
		DiscordRPC.refresh()
	
	if ModeManager.isin_settings:
		$BACK_Button.show()
		
	if !ModeManager.isin_settings:
		$LanguageSelect/BootupBlackscreen.play("blackscreen")
	
	var video_settings = SettingsManager.load_video_settings()
	check_button.button_pressed = video_settings.full_screen
	vsync_button.button_pressed = video_settings.vsync
	
	var audio_settings = SettingsManager.load_audio_settings()
	volume_master.value = min(audio_settings.master_volume, 1.0) * 100
	volume_master_bgm.value = min(audio_settings.bgm_volume, 1.0) * 100
	volume_master_sfx.value = min(audio_settings.sfx_volume, 1.0) * 100
	volume_master_voices.value = min(audio_settings.voices_volume, 1.0) * 100
	volume_master_ambience.value = min(audio_settings.ambience_volume, 1.0) * 100
	
	if ModeManager.in_gameplay == true:
		misc_tab.disabled = true
	

func _on_sfx_test_button_pressed() -> void:
	sfx_test.play()


func _on_voices_test_button_pressed() -> void:
	voice_test.play()


func _on_back_button_pressed() -> void:
	deselect.play()
	LoadManager.load_scene("res://scenes/menu/settings.tscn")


func _on_resolutons_option_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))
		3:
			DisplayServer.window_set_size(Vector2i(1152,648))
	SettingsManager.save_video_settings("resolution", index)


func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		toggled_on_sfx.play()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		toggled_off_sfx.play()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	SettingsManager.save_video_settings("fullscreen", toggled_on)


func _on_vsync_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		toggled_on_sfx.play()
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		toggled_off_sfx.play()
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	SettingsManager.save_video_settings("vsync", toggled_on)


func _on_vol_res_tab_pressed() -> void:
	select.play()
	volume_resolution.show()
	controls.hide()
	miscellaneous.hide()


func _on_control_tab_pressed() -> void:
	select.play()
	volume_resolution.hide()
	controls.show()
	miscellaneous.hide()

func _on_misc_tab_pressed() -> void:
	select.play()
	volume_resolution.hide()
	controls.hide()
	miscellaneous.show()

func _on_check_mods_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		toggled_on_sfx.play()
	else:
		toggled_off_sfx.play()
	


func _on_volume_master_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SettingsManager.save_audio_settings("master_volume", volume_master.value / 100)


func _on_volume_master_bgm_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SettingsManager.save_audio_settings("bgm_volume", volume_master_bgm.value / 100)


func _on_volume_master_sfx_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SettingsManager.save_audio_settings("sfx_volume", volume_master_sfx.value / 100)


func _on_volume_master_voices_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SettingsManager.save_audio_settings("voices_volume", volume_master_voices.value / 100)

func _on_volume_master_ambience_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SettingsManager.save_audio_settings("ambience_volume", volume_master_ambience.value / 100)


func _on_credits_button_pressed() -> void:
	select.play()
	LoadManager.load_scene("res://CREDITS/GodotCredits.tscn")


func _on_control_player_1_pressed() -> void:
	control_player_1.disabled = true
	control_player_2.disabled = false
	control_player_3.disabled = false
	control_player_4.disabled = false
	controls_player_1.show()
	controls_player_2.hide()
	controls_player_3.hide()
	controls_player_4.hide()


func _on_control_player_2_pressed() -> void:
	control_player_1.disabled = false
	control_player_2.disabled = true
	control_player_3.disabled = false
	control_player_4.disabled = false
	controls_player_1.hide()
	controls_player_2.show()
	controls_player_3.hide()
	controls_player_4.hide()


func _on_control_player_3_pressed() -> void:
	control_player_1.disabled = false
	control_player_2.disabled = false
	control_player_3.disabled = true
	control_player_4.disabled = false
	controls_player_1.hide()
	controls_player_2.hide()
	controls_player_3.show()
	controls_player_4.hide()


func _on_control_player_4_pressed() -> void:
	control_player_1.disabled = false
	control_player_2.disabled = false
	control_player_3.disabled = false
	control_player_4.disabled = true
	controls_player_1.hide()
	controls_player_2.hide()
	controls_player_3.hide()
	controls_player_4.show()


func _on_go_button_pressed() -> void:
	select.play()
	LoadManager.load_scene("res://scenes/menu/disclaimer_screen.tscn")


func _on_english_button_pressed() -> void:
	select.play()
	LanguageManager.language = "english"
	LanguageManager.shortlang = "eng"
	english_button.disabled = true
	spanish_button.disabled = false
	french_button.disabled = false
	italian_button.disabled = false
	german_button.disabled = false
	japanese_button.disabled = false
	$YouTubeButton.text = "Youtube-Safe Mode"
	if !ModeManager.isin_settings:
		$LanguageSelect/GO_Button.show()


func _on_spanish_button_pressed() -> void:
	select.play()
	LanguageManager.language = "spanish"
	LanguageManager.shortlang = "spa"
	english_button.disabled = false
	spanish_button.disabled = true
	french_button.disabled = false
	italian_button.disabled = false
	german_button.disabled = false
	japanese_button.disabled = false
	$YouTubeButton.text = "Modo seguro de YouTube"
	if !ModeManager.isin_settings:
		$LanguageSelect/GO_Button.show()


func _on_french_button_pressed() -> void:
	select.play()
	LanguageManager.language = "french"
	LanguageManager.shortlang = "fre"
	english_button.disabled = false
	spanish_button.disabled = false
	french_button.disabled = true
	italian_button.disabled = false
	german_button.disabled = false
	japanese_button.disabled = false
	$YouTubeButton.text = "Mode sans échec de YouTube"
	if !ModeManager.isin_settings:
		$LanguageSelect/GO_Button.show()


func _on_italian_button_pressed() -> void:
	select.play()
	LanguageManager.language = "italian"
	LanguageManager.shortlang = "ita"
	english_button.disabled = false
	spanish_button.disabled = false
	french_button.disabled = false
	italian_button.disabled = true
	german_button.disabled = false
	japanese_button.disabled = false
	$YouTubeButton.text = "Modalità sicura di Youtube"
	if !ModeManager.isin_settings:
		$LanguageSelect/GO_Button.show()


func _on_german_button_pressed() -> void:
	select.play()
	LanguageManager.language = "german"
	LanguageManager.shortlang = "ger"
	english_button.disabled = false
	spanish_button.disabled = false
	french_button.disabled = false
	italian_button.disabled = false
	german_button.disabled = true
	japanese_button.disabled = false
	$YouTubeButton.text = "YouTube-Sicherheitsmodus"
	if !ModeManager.isin_settings:
		$LanguageSelect/GO_Button.show()


func _on_japanese_button_pressed() -> void:
	select.play()
	LanguageManager.language = "japanese"
	LanguageManager.shortlang = "jpn"
	english_button.disabled = false
	spanish_button.disabled = false
	french_button.disabled = false
	italian_button.disabled = false
	german_button.disabled = false
	japanese_button.disabled = true
	$YouTubeButton.text = "Youtubeセーフモード"
	if !ModeManager.isin_settings:
		$LanguageSelect/GO_Button.show()


func _on_you_tube_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		toggled_on_sfx.play()
		AltBgmManager.enabled = true
	else:
		toggled_off_sfx.play()
		AltBgmManager.enabled = false
