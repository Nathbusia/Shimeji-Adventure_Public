extends Panel

@onready var InputButtons = preload("res://scenes/menu/settings_controls/input_button.tscn")
@onready var action_list: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/ActionList

var is_remapping = false
var action_to_remap = null
var remapping_button = null

var input_actions = {
	"left" = "Move Left",
	"right" = "Move Right",
	"up" = "Climb Up",
	"run" = "Run/Dash",
	"jump" = "Jump",
	"sit" = "Sit/Slam Dash/Climb Down",
	"grab" = "Grab/Custom Attack",
	"chat" = "Interact",
	"start" = "Start",
	"pause" = "Pause",
	"dialogic_default_action" = "Dialogue Action",
	"taunt" =  "Taunt",
	"shoot" = "Shoot (Power Up)",
	"playertagcheck" = "Check Player Tag (Multiplayer Only)",
	"teleport" = "Teleport"
}

var input_actions_spa = {
	"left" = "Izquierda",
	"right" = "Derecha",
	"up" = "Treparse",
	"run" = "Correr",
	"jump" = "Brinco",
	"sit" = "Sentar/Slam Dash/Baja",
	"grab" = "Grab/Ataque personalizado",
	"chat" = "Interactuar",
	"start" = "Empiezo",
	"pause" = "Pausa",
	"dialogic_default_action" = "Acción de diálogo",
	"taunt" =  "Pulla",
	"shoot" = "Dispara (Power Up)",
	"playertagcheck" = "Comprobar etiqueta de jugador (solo multijugador)",
	"teleport" = "Teletransportarse"
}

var input_actions_fre = {
	"left" = "Gauche",
	"right" = "Droite",
	"up" = "Grimper Haut",
	"run" = "Courir",
	"jump" = "Saute",
	"sit" = "S'asseoir/Slam Dash/Descendre",
	"grab" = "Grab/Attaque personnalisée",
	"chat" = "Interagir",
	"start" = "Démarrer",
	"pause" = "Pause",
	"dialogic_default_action" = "Action de dialogue",
	"taunt" =  "Raillerie",
	"shoot" = "Tirer (Power Up)",
	"playertagcheck" = "Vérifiez le Tag du Joueur (Multijoueur uniquement)",
	"teleport" = "Téléporter"
}

var input_actions_ita = {
	"left" = "Sinistra",
	"right" = "Destro",
	"up" = "Salire",
	"run" = "Correre",
	"jump" = "Salto",
	"sit" = "Sedersi/Slam Dash/Scendere",
	"grab" = "Grab/Attacco personalizzato",
	"chat" = "Interagire",
	"start" = "Inizio",
	"pause" = "Pausa",
	"dialogic_default_action" = "Dialogo Azione",
	"taunt" =  "Provocare",
	"shoot" = "Sparare (Power Up)",
	"playertagcheck" = "Controlla il Tag del Giocatore (Solo Multigiocatore)",
	"teleport" = "Teletrasportarsi"
}

var input_actions_ger = {
	"left" = "Linke",
	"right" = "Rechte",
	"up" = "Hinaufklettern",
	"run" = "Laufen",
	"jump" = "Springen",
	"sit" = "Sitzen/Slam Dash/Absteigen",
	"grab" = "Grab/Benutzerdefinierter Angriff",
	"chat" = "Interagieren",
	"start" = "Start",
	"pause" = "Pause",
	"dialogic_default_action" = "Dialogaktion",
	"taunt" =  "Verspotten",
	"shoot" = "Schießen (Power Up)",
	"playertagcheck" = "Player-Tag prüfen (nur Multiplayer)",
	"teleport" = "Teleportieren"
}

var input_actions_jpn = {
	"left" = "左に移動",
	"right" = "右に移動",
	"up" = "登る",
	"run" = "走る/ダッシュ",
	"jump" = "ジャンプ",
	"sit" = "座る/スラムダッシュ/降りる",
	"grab" = "掴む/カスタム攻撃",
	"chat" = "交流する",
	"start" = "始める",
	"pause" = "ポーズ",
	"dialogic_default_action" = "対話アクション",
	"taunt" =  "からかう",
	"shoot" = "シュート（パワーアップ）",
	"playertagcheck" = "プレイヤータグを確認する（マルチプレイヤーのみ）",
	"teleport" = "テレポート"
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
