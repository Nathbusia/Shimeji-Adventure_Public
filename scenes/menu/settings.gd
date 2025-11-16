extends Control
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

func _ready():
	if !ModeManager.in_gameplay:
		DiscordRPC.state = "In the Settings Menu"
		DiscordRPC.details = ""
		DiscordRPC.refresh()
		ModeManager.isin_settings = true
	
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

	match LanguageManager.language:
		"spanish":
			$SettingsText.text = "Configuración"
			$Volume_Resolution/VolumeSetting/VolumeTextMaster.text = "Maestro:"
			$Volume_Resolution/VolumeSetting/VolumeTextVoices.text = "Voces:"
			$Volume_Resolution/VolumeSetting/VolumeTextVoices2.text = "Ambiente:"
			$Volume_Resolution/VolumeSetting/VolumeText.text = "Volumen"
			$Volume_Resolution/VolumeSetting/SFXTestButton/Text.text = "Prueba SFX"
			$Volume_Resolution/VolumeSetting/VoicesTestButton/Text.text = "Prueba Voces"
			$Volume_Resolution/Resolution/ResolutionText.text = "Resolución"
			$Volume_Resolution/Resolution/CheckButton.text = "Pantalla completa"
			$Controls/Control_Player1/Text.text = "Jugador 1"
			$Controls/Control_Player2/Text.text = "Jugador 2"
			$Controls/Control_Player3/Text.text = "Jugador 3"
			$Controls/Control_Player4/Text.text = "Jugador 4"
			$Miscellaneous/CreditsButton/Text.text = "Ver créditos"
			$Miscellaneous/LanguageButton/Text.text = "Cambiar idioma"
			$Vol_Res_Tab/Text.text = "Volumen y resolución"
			$Control_Tab/Text.text = "Controles"
			$Misc_Tab/Text.text = "Varios"
			$Controls/Controls_Player1/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Restablecer a Predeterminado"
			$Controls/Controls_Player2/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Restablecer a Predeterminado"
			$Controls/Controls_Player3/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Restablecer a Predeterminado"
			$Controls/Controls_Player4/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Restablecer a Predeterminado"
		"french":
			$SettingsText.text = "Paramètres"
			$Volume_Resolution/VolumeSetting/VolumeTextMaster.text = "Maître :"
			$Volume_Resolution/VolumeSetting/VolumeTextVoices.text = "Voix :"
			$Volume_Resolution/VolumeSetting/VolumeTextVoices2.text = "Ambiance :"
			$Volume_Resolution/VolumeSetting/SFXTestButton/Text.text = "SFX de test"
			$Volume_Resolution/VolumeSetting/VoicesTestButton/Text.text = "Voix de test"
			$Volume_Resolution/Resolution/ResolutionText.text = "Résolution"
			$Volume_Resolution/Resolution/CheckButton.text = "Plein écran"
			$Controls/Control_Player1/Text.text = "Joueur 1"
			$Controls/Control_Player2/Text.text = "Joueur 2"
			$Controls/Control_Player3/Text.text = "Joueur 3"
			$Controls/Control_Player4/Text.text = "Joueur 4"
			$Miscellaneous/CreditsButton/Text.text = "Voir les crédits"
			$Miscellaneous/LanguageButton/Text.text = "Changer de langue"
			$Vol_Res_Tab/Text.text = "Volume et résolution"
			$Control_Tab/Text.text = "Contrôles"
			$Misc_Tab/Text.text = "Divers"
			$Controls/Controls_Player1/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Réinitialiser par défaut"
			$Controls/Controls_Player2/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Réinitialiser par défaut"
			$Controls/Controls_Player3/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Réinitialiser par défaut"
			$Controls/Controls_Player4/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Réinitialiser par défaut"
		"italian":
			$SettingsText.text = "Impostazioni"
			$Volume_Resolution/VolumeSetting/VolumeTextMaster.text = "Maestro:"
			$Volume_Resolution/VolumeSetting/VolumeTextVoices.text = "Voci:"
			$Volume_Resolution/VolumeSetting/VolumeTextVoices2.text = "Ambiente:"
			$Volume_Resolution/VolumeSetting/SFXTestButton/Text.text = "Prova SFX"
			$Volume_Resolution/VolumeSetting/VoicesTestButton/Text.text = "Prova Voci"
			$Volume_Resolution/Resolution/ResolutionText.text = "Risoluzione"
			$Volume_Resolution/Resolution/CheckButton.text = "Schermo intero"
			$Controls/Control_Player1/Text.text = "Giocatore 1"
			$Controls/Control_Player2/Text.text = "Giocatore 2"
			$Controls/Control_Player3/Text.text = "Giocatore 3"
			$Controls/Control_Player4/Text.text = "Giocatore 4"
			$Miscellaneous/CreditsButton/Text.text = "Visualizza i crediti"
			$Miscellaneous/LanguageButton/Text.text = "Cambia lingua"
			$Vol_Res_Tab/Text.text = "Volume e risoluzione"
			$Control_Tab/Text.text = "Controlli"
			$Misc_Tab/Text.text = "Varie"
			$Controls/Controls_Player1/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Reimposta su Predefinito"
			$Controls/Controls_Player2/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Reimposta su Predefinito"
			$Controls/Controls_Player3/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Reimposta su Predefinito"
			$Controls/Controls_Player4/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Reimposta su Predefinito"
		"german":
			$SettingsText.text = "Einstellungen"
			$Volume_Resolution/VolumeSetting/VolumeTextMaster.text = "Meister:"
			$Volume_Resolution/VolumeSetting/VolumeTextVoices.text = "Stimmen:"
			$Volume_Resolution/VolumeSetting/VolumeTextVoices2.text = "Ambiente:"
			$Volume_Resolution/VolumeSetting/VolumeText.text = "Volumen"
			$Volume_Resolution/VolumeSetting/VoicesTestButton/Text.text = "Test Stimmen"
			$Volume_Resolution/Resolution/ResolutionText.text = "Auflösung"
			$Volume_Resolution/Resolution/CheckButton.text = "Vollbild"
			$Controls/Control_Player1/Text.text = "Spieler 1"
			$Controls/Control_Player2/Text.text = "Spieler 2"
			$Controls/Control_Player3/Text.text = "Spieler 3"
			$Controls/Control_Player4/Text.text = "Spieler 4"
			$Miscellaneous/CreditsButton/Text.text = "Credits anzeigen"
			$Miscellaneous/LanguageButton/Text.text = "Sprache ändern"
			$Vol_Res_Tab/Text.text = "Volumen und Auflösung"
			$Control_Tab/Text.text = "Bedienelemente"
			$Misc_Tab/Text.text = "Verschiedenes"
			$Controls/Controls_Player1/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Auf Standard zurücksetzen"
			$Controls/Controls_Player2/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Auf Standard zurücksetzen"
			$Controls/Controls_Player3/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Auf Standard zurücksetzen"
			$Controls/Controls_Player4/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "Auf Standard zurücksetzen"
		"japanese":
			$SettingsText.text = "オプション"
			$Volume_Resolution/VolumeSetting/VolumeTextMaster.text = "マスター："
			$Volume_Resolution/VolumeSetting/VolumeTextVoices.text = "声："
			$Volume_Resolution/VolumeSetting/VolumeTextVoices2.text = "雰囲気："
			$Volume_Resolution/VolumeSetting/VolumeText.text = "音量"
			$Volume_Resolution/VolumeSetting/SFXTestButton/Text.text = "テストSFX"
			$Volume_Resolution/VolumeSetting/VoicesTestButton/Text.text = "テスト声"
			$Volume_Resolution/Resolution/ResolutionText.text = "解決"
			$Volume_Resolution/Resolution/CheckButton.text = "全画面表示"
			$Volume_Resolution/Resolution/VsyncButton.text = "垂直同期"
			$Controls/Control_Player1/Text.text = "1 Player"
			$Controls/Control_Player2/Text.text = "2 Player"
			$Controls/Control_Player3/Text.text = "3 Player"
			$Controls/Control_Player4/Text.text = "4 Player"
			$Miscellaneous/CreditsButton/Text.text = "クレジットを見る"
			$Miscellaneous/LanguageButton/Text.text = "言語を変更"
			$Vol_Res_Tab/Text.text = "音量と解像度"
			$Control_Tab/Text.text = "コントロール"
			$Misc_Tab/Text.text = "その他"
			$Controls/Controls_Player1/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "デフォルトにリセット"
			$Controls/Controls_Player2/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "デフォルトにリセット"
			$Controls/Controls_Player3/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "デフォルトにリセット"
			$Controls/Controls_Player4/PanelContainer/MarginContainer/VBoxContainer/ResetButton.text = "デフォルトにリセット"
		_:
			return
			#Engish once more

func _on_sfx_test_button_pressed() -> void:
	sfx_test.play()


func _on_voices_test_button_pressed() -> void:
	voice_test.play()


func _on_back_button_pressed() -> void:
	deselect.play()
	if ModeManager.in_gameplay == true:
		queue_free()
	else:
		ModeManager.isin_settings = false
		LoadManager.load_scene("res://scenes/menu/main_menu.tscn")


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


func _on_language_button_pressed() -> void:
	select.play()
	LoadManager.load_scene("res://scenes/menu/language_select.tscn")
