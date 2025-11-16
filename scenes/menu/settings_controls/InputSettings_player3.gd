extends Panel

@onready var InputButtons = preload("res://scenes/menu/settings_controls/input_button.tscn")
@onready var action_list: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/ActionList

var is_remapping = false
var action_to_remap = null
var remapping_button = null

var input_actions = {
	"left_p3" = "Move Left",
	"right_p3" = "Move Right",
	"up_p3" = "Climb Up",
	"run_p3" = "Run/Dash",
	"jump_p3" = "Jump",
	"sit_p3" = "Sit/Slam Dash/Climb Down",
	"grab_p3" = "Grab/Interact/Custom Attack",
	"start_p3" = "Start",
	"taunt_p3" =  "Taunt",
	"shoot_p3" = "Shoot (Power Up)",
	"playertagcheck_p3" = "Check Player Tag (Multiplayer Only)",
	"teleport_p3" = "Teleport"
}

var input_actions_spa = {
	"left_p3" = "Izquierda",
	"right_p3" = "Derecha",
	"up_p3" = "Treparse",
	"run_p3" = "Correr",
	"jump_p3" = "Brinco",
	"sit_p3" = "Sentar/Slam Dash/Baja",
	"grab_p3" = "Grab/Interactuar/Ataque personalizado",
	"start_p3" = "Empiezo",
	"taunt_p3" =  "Pulla",
	"shoot_p3" = "Dispara (Power Up)",
	"playertagcheck_p3" = "Comprobar etiqueta de jugador (solo multijugador)",
	"teleport_p3" = "Teletransportarse"
}

var input_actions_fre = {
	"left_p3" = "Gauche",
	"right_p3" = "Droite",
	"up_p3" = "Grimper Haut",
	"run_p3" = "Courir",
	"jump_p3" = "Saute",
	"sit_p3" = "S'asseoir/Slam Dash/Descendre",
	"grab_p3" = "Grab/interagir/Attaque personnalisée",
	"start_p3" = "Démarrer",
	"taunt_p3" =  "Raillerie",
	"shoot_p3" = "Tirer (Power Up)",
	"playertagcheck_p3" = "Vérifiez le Tag du Joueur (Multijoueur uniquement)",
	"teleport_p3" = "Téléporter"
}

var input_actions_ita = {
	"left_p3" = "Sinistra",
	"right_p3" = "Destro",
	"up_p3" = "Salire",
	"run_p3" = "Correre",
	"jump_p3" = "Salto",
	"sit_p3" = "Sedersi/Slam Dash/Scendere",
	"grab_p3" = "Grab/Interagire/Attacco personalizzato",
	"start_p3" = "Inizio",
	"taunt_p3" =  "Provocare",
	"shoot_p3" = "Sparare (Power Up)",
	"playertagcheck_p3" = "Controlla il Tag del Giocatore (Solo Multigiocatore)",
	"teleport_p3" = "Teletrasportarsi"
}

var input_actions_ger = {
	"left_p3" = "Linke",
	"right_p3" = "Rechte",
	"up_p3" = "Hinaufklettern",
	"run_p3" = "Laufen",
	"jump_p3" = "Springen",
	"sit_p3" = "Sitzen/Slam Dash/Absteigen",
	"grab_p3" = "Grab/Interagieren/Benutzerdefinierter Angriff",
	"start_p3" = "Start",
	"taunt_p3" =  "Verspotten",
	"shoot_p3" = "Schießen (Power Up)",
	"playertagcheck_p3" = "Player-Tag prüfen (nur Multiplayer)",
	"teleport_p3" = "Teleportieren"
}

var input_actions_jpn = {
	"left_p3" = "左に移動",
	"right_p3" = "右に移動",
	"up_p3" = "登る",
	"run_p3" = "走る/ダッシュ",
	"jump_p3" = "ジャンプ",
	"sit_p3" = "座る/スラムダッシュ/降りる",
	"grab_p3" = "掴む/交流する/カスタム攻撃",
	"start_p3" = "始める",
	"taunt_p3" =  "からかう",
	"shoot_p3" = "シュート（パワーアップ）",
	"playertagcheck_p3" = "プレイヤータグを確認する（マルチプレイヤーのみ）",
	"teleport_p3" = "テレポート"
}

func _ready():
	_load_keybindings_from_settings()
	_create_action_list()

func _create_action_list():
	for item in action_list.get_children():
		item.queue_free()
	
	for action in input_actions:
		var button = InputButtons.instantiate()
		var action_label = button.find_child("LabelAction")
		var input_label = button.find_child("LabelInput")
		
		match LanguageManager.language:
			"spanish":
				action_label.text = input_actions_spa[action]
			"french":
				action_label.text = input_actions_fre[action]
			"italian":
				action_label.text = input_actions_ita[action]
			"german":
				action_label.text = input_actions_ger[action]
			"japanese":
				action_label.text = input_actions_jpn[action]
			_:
				action_label.text = input_actions[action]
		
		var events = InputMap.action_get_events(action)
		if events.size() > 0:
			input_label.text = events[0].as_text().trim_suffix(" (Physical)")
		else:
			input_label.text = ""
		
		action_list.add_child(button)
		button.pressed.connect(_on_input_button_pressed.bind(button, action))

func _on_input_button_pressed(button, action):
	if !is_remapping:
		is_remapping = true
		action_to_remap = action
		remapping_button = button
		match LanguageManager.language:
			"spanish":
				button.find_child("LabelInput").text = "Presiona la tecla/botón para vincular..."
			"french":
				button.find_child("LabelInput").text = "Appuyez sur la touche/bouton pour lier..."
			"italian":
				button.find_child("LabelInput").text = "Premi Tasto/Pulsante per assegnare..."
			"german":
				button.find_child("LabelInput").text = "Drücken Sie eine Taste/Schaltfläche, um sie zuzuweisen..."
			"japanese":
				button.find_child("LabelInput").text = "キー／ボタンを押して割り当ててください..."
			_:
				button.find_child("LabelInput").text = "Press Key/Button to bind..."

func _input(event):
	if is_remapping:
		if (
			event is InputEventKey || event is InputEventJoypadButton || event is InputEventJoypadMotion ||
			(event is InputEventMouseButton && event.pressed)
		):
			#Preventing Double clicking
			if event  is InputEventMouseButton && event.double_click:
				event.double_click = false
			
			InputMap.action_erase_events(action_to_remap)
			InputMap.action_add_event(action_to_remap, event)
			SettingsManager.save_keybinding(action_to_remap, event)
			_update_action_list(remapping_button, event)
			
			is_remapping = false
			action_to_remap = null
			remapping_button = null
			
			accept_event()

func _update_action_list(button, event):
	button.find_child("LabelInput").text = event.as_text().trim_suffix(" (Physical)")

func _load_keybindings_from_settings():
	var keybindings = SettingsManager.load_keybinding()
	for action in keybindings.keys():
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, keybindings[action])

func _on_reset_button_pressed() -> void:
	InputMap.load_from_project_settings()
	for action in input_actions:
		var events = InputMap.action_get_events(action)
		if events.size() > 0:
			SettingsManager.save_keybinding(action, events[0])
	_create_action_list()
