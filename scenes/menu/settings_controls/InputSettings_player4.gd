extends Panel

@onready var InputButtons = preload("res://scenes/menu/settings_controls/input_button.tscn")
@onready var action_list: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/ActionList

var is_remapping = false
var action_to_remap = null
var remapping_button = null

var input_actions = {
	"left_p4" = "Move Left",
	"right_p4" = "Move Right",
	"up_p4" = "Climb Up",
	"run_p4" = "Run/Dash",
	"jump_p4" = "Jump",
	"sit_p4" = "Sit/Slam Dash/Climb Down",
	"grab_p4" = "Grab/Interact/Custom Attack",
	"start_p4" = "Start",
	"taunt_p4" =  "Taunt",
	"shoot_p4" = "Shoot (Power Up)",
	"playertagcheck_p4" = "Check Player Tag (Multiplayer Only)",
	"teleport_p4" = "Teleport"
}

var input_actions_spa = {
	"left_p4" = "Izquierda",
	"right_p4" = "Derecha",
	"up_p4" = "Treparse",
	"run_p4" = "Correr",
	"jump_p4" = "Brinco",
	"sit_p4" = "Sentar/Slam Dash/Baja",
	"grab_p4" = "Grab/Interactuar/Ataque personalizado",
	"start_p4" = "Empiezo",
	"taunt_p4" =  "Pulla",
	"shoot_p4" = "Dispara (Power Up)",
	"playertagcheck_p4" = "Comprobar etiqueta de jugador (solo multijugador)",
	"teleport_p4" = "Teletransportarse"
}

var input_actions_fre = {
	"left_p4" = "Gauche",
	"right_p4" = "Droite",
	"up_p4" = "Grimper Haut",
	"run_p4" = "Courir",
	"jump_p4" = "Saute",
	"sit_p4" = "S'asseoir/Slam Dash/Descendre",
	"grab_p4" = "Grab/interagir/Attaque personnalisée",
	"start_p4" = "Démarrer",
	"taunt_p4" =  "Raillerie",
	"shoot_p4" = "Tirer (Power Up)",
	"playertagcheck_p4" = "Vérifiez le Tag du Joueur (Multijoueur uniquement)",
	"teleport_p4" = "Téléporter"
}

var input_actions_ita = {
	"left_p4" = "Sinistra",
	"right_p4" = "Destro",
	"up_p4" = "Salire",
	"run_p4" = "Correre",
	"jump_p4" = "Salto",
	"sit_p4" = "Sedersi/Slam Dash/Scendere",
	"grab_p4" = "Grab/Interagire/Attacco personalizzato",
	"start_p4" = "Inizio",
	"taunt_p4" =  "Provocare",
	"shoot_p4" = "Sparare (Power Up)",
	"playertagcheck_p4" = "Controlla il Tag del Giocatore (Solo Multigiocatore)",
	"teleport_p4" = "Teletrasportarsi"
}

var input_actions_ger = {
	"left_p4" = "Linke",
	"right_p4" = "Rechte",
	"up_p4" = "Hinaufklettern",
	"run_p4" = "Laufen",
	"jump_p4" = "Springen",
	"sit_p4" = "Sitzen/Slam Dash/Absteigen",
	"grab_p4" = "Grab/Interagieren/Benutzerdefinierter Angriff",
	"start_p4" = "Start",
	"taunt_p4" =  "Verspotten",
	"shoot_p4" = "Schießen (Power Up)",
	"playertagcheck_p4" = "Player-Tag prüfen (nur Multiplayer)",
	"teleport_p4" = "Teleportieren"
}

var input_actions_jpn = {
	"left_p4" = "左に移動",
	"right_p4" = "右に移動",
	"up_p4" = "登る",
	"run_p4" = "走る/ダッシュ",
	"jump_p4" = "ジャンプ",
	"sit_p4" = "座る/スラムダッシュ/降りる",
	"grab_p4" = "掴む/交流する/カスタム攻撃",
	"start_p4" = "始める",
	"taunt_p4" =  "からかう",
	"shoot_p4" = "シュート（パワーアップ）",
	"playertagcheck_p4" = "プレイヤータグを確認する（マルチプレイヤーのみ）",
	"teleport_p4" = "テレポート"
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
