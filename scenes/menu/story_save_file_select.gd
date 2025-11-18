extends Node2D

@onready var back_button: TextureButton = $BACK_Button
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover

@onready var new_game_screen: Panel = $NewGameScreen
@onready var current_save_screen: Panel = $CurrentSaveScreen

@onready var current_world: Label = $Information/SavefileInfo/CurrentWorld
@onready var world_text: Label = $Information/SavefileInfo/WorldText
@onready var lives: Label = $Information/SavefileInfo/Lives
@onready var lives_count: Label = $Information/SavefileInfo/LivesCount
@onready var triangle_collected: Label = $Information/SavefileInfo/TriangleCollected
@onready var tri_amount: Label = $Information/SavefileInfo/TriAmount
@onready var tri_max: Label = $Information/SavefileInfo/TriMax


@onready var new_button: TextureButton = $New_Button
@onready var continue_button: TextureButton = $Continue_Button
@onready var world_thumbnail: TextureRect = $Information/WorldThumbnail

@onready var savefile_info: Control = $Information/SavefileInfo
@onready var no_file_info: Control = $Information/NoFileInfo
@onready var player_amount: Control = $PlayerAmount

@onready var player_amount_one: TextureButton = $PlayerAmount/PlayerPanel/PlayerAmount_One
@onready var player_amount_two: TextureButton = $PlayerAmount/PlayerPanel/PlayerAmount_Two
@onready var player_amount_three: TextureButton = $PlayerAmount/PlayerPanel/PlayerAmount_Three
@onready var player_amount_four: TextureButton = $PlayerAmount/PlayerPanel/PlayerAmount_Four
@onready var go_button_players: TextureButton = $PlayerAmount/PlayerPanel/GO_Button_Players

@onready var story_text: AnimatedSprite2D = $StoryText

var alreadysave = false
var in_currentsaveinfo = false
var can_choose = true
var has_hoverplayed = false
var has_hovertext = false
var choose_savefile1
var has_clicked

func _ready() -> void:
	DiscordRPC.state = "In the Story Mode Menu"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	SaveGame.load_game()
	choose_savefile1 = true
	
	if AltBgmManager.enabled:
		$MenuMusic.stream = load("res://bgm/menu/bgm_mainmenu_ytsafe.ogg")
		$MenuMusic.play()
	else:
		pass
	
	match LanguageManager.language:
		"spanish":
			$Information/ProgressText.text = "Progreso:"
			$Information/SavefileInfo/CurrentWorld.text = "Mundo actual:"
			$Information/SavefileInfo/Lives.text = "Vidas:"
			$Information/SavefileInfo/TriangleCollected.text = "Triángulos recogidos:"
			$Information/NoFileInfo/NoFile.text = "No existe ningún archivo de guardado.
Pulsa el botón 'New' para empezar una partida nueva."
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "¿Cuántos jugadores?"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "Uno"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "Dos"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "Tres"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "Cuatro"
			$NewGameScreen/MessageBG/MessageText.text = "¿Estás seguro de que quieres iniciar una nueva partida?
(Se eliminarán todos los archivos guardados existentes)."
			$NewGameScreen/DecisionButtons/Yes_Button.hide()
			$NewGameScreen/DecisionButtons/Yes_Button_SPA.show()
			$Continue_Button.hide()
			$Continue_Button_SPA.show()
		"french":
			$Information/ProgressText.text = "Progrès:"
			$Information/SavefileInfo/CurrentWorld.text = "Monde actuel:"
			$Information/SavefileInfo/Lives.text = "Vies:"
			$Information/SavefileInfo/TriangleCollected.text = "Triangles collectés:"
			$Information/NoFileInfo/NoFile.text = "Aucun fichier de sauvegarde n'existe.
Appuyez sur le bouton « New » pour commencer une nouvelle partie !"
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "Combien de joueurs ?"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "Un"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "Deux"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "Trois"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "Quatre"
			$NewGameScreen/MessageBG/MessageText.text = "Êtes-vous sûr de vouloir commencer une nouvelle partie ?
(Tous les fichiers de sauvegarde existants seront supprimés.)"
			$NewGameScreen/DecisionButtons/Yes_Button.hide()
			$NewGameScreen/DecisionButtons/Yes_Button_FRE.show()
			$NewGameScreen/DecisionButtons/No_Button.hide()
			$NewGameScreen/DecisionButtons/No_Button_FRE.show()
			$Continue_Button.hide()
			$Continue_Button_FRE.show()
		"italian":
			$Information/ProgressText.text = "Progressi:"
			$Information/SavefileInfo/CurrentWorld.text = "Mondo attuale:"
			$Information/SavefileInfo/Lives.text = "Vita:"
			$Information/SavefileInfo/TriangleCollected.text = "Triangoli raccolti:"
			$Information/NoFileInfo/NoFile.text = "Non esiste alcun file di salvataggio.
Premi il pulsante 'New' per iniziare una nuova partita!"
			$NewGameScreen/DecisionButtons/Yes_Button.hide()
			$NewGameScreen/DecisionButtons/Yes_Button_ITA.show()
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "Quanti giocatori?"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "Uno"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "Due"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "Tre"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "Quattro"
			$NewGameScreen/MessageBG/MessageText.text = "Sei sicuro di voler iniziare una nuova partita?
(Tutti i file di salvataggio esistenti verranno eliminati.)"
			$Continue_Button.hide()
			$Continue_Button_ITA.show()
		"german":
			$Information/ProgressText.text = "Fortschritt:"
			$Information/SavefileInfo/CurrentWorld.text = "Aktuelle Welt:"
			$Information/SavefileInfo/Lives.text = "Leben:"
			$Information/SavefileInfo/TriangleCollected.text = "Dreiecke gesammelt:"
			$Information/NoFileInfo/NoFile.text = "Es ist keine Speicherdatei vorhanden.
Drücken Sie die Schaltfläche „New“, um ein neues Spiel zu starten!"
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "Wie viele Spieler?"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "Eins"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "Zwei"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "Drei"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "Vier"
			$NewGameScreen/MessageBG/MessageText.text = "Möchten Sie wirklich ein neues Spiel starten?
(Alle vorhandenen Speicherstände werden gelöscht.)"
			$NewGameScreen/DecisionButtons/Yes_Button.hide()
			$NewGameScreen/DecisionButtons/Yes_Button_GER.show()
			$NewGameScreen/DecisionButtons/No_Button.hide()
			$NewGameScreen/DecisionButtons/No_Button_GER.show()
			$Continue_Button.hide()
			$Continue_Button_GER.show()
		"japanese":
			$Information/ProgressText.text = "進捗："
			$Information/SavefileInfo/CurrentWorld.text = "現在の世界:"
			$Information/SavefileInfo/Lives.text = "生活:"
			$Information/SavefileInfo/TriangleCollected.text = "集めた三角形:"
			$Information/NoFileInfo/NoFile.text = "セーブファイルが存在しません。
「New」ボタンを押して新しいゲームを開始してください！"
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "プレイヤーは何人ですか？"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "一"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "二"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "三"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "四"
			$NewGameScreen/MessageBG/MessageText.text = "新しいゲームを始めることを確認しますか？
（既存のセーブデータはすべて削除されます。）"
			$NewGameScreen/DecisionButtons/Yes_Button.hide()
			$NewGameScreen/DecisionButtons/Yes_Button_JPN.show()
			$NewGameScreen/DecisionButtons/No_Button.hide()
			$NewGameScreen/DecisionButtons/No_Button_JPN.show()
			$Continue_Button.hide()
			$Continue_Button_JPN.show()
		_:
			return
			#English as usual.

	story_text.play("storytext_" + LanguageManager.shortlang)

func _process(delta):
	if FileAccess.file_exists("user://savefiles/shime_story_savefile1.tres"):
		continue_button.disabled = false
		$Continue_Button_FRE.disabled = false
		$Continue_Button_GER.disabled = false
		$Continue_Button_ITA.disabled = false
		$Continue_Button_JPN.disabled = false
		$Continue_Button_SPA.disabled = false
		world_text.text = SaveFileManager.currentworld
		lives_count.text = str(SaveFileManager.data_dic["maxlives"])
		tri_amount.text = str(SaveFileManager.data_dic["maxtriangles"])
		match SaveFileManager.currentworld:
			"world1":
				var texture = load("res://sprites/menu/levelselect/worldicon/worldselect_thumbnail_world1.png")
				world_thumbnail.texture = texture
			"world2":
				var texture = load("res://sprites/menu/levelselect/worldicon/worldselect_thumbnail_world2.png")
				world_thumbnail.texture = texture
		savefile_info.show()
		no_file_info.hide()
	
	if continue_button.is_hovered() && !continue_button.disabled && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	
	elif new_button.is_hovered() && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true

	else:
		has_hoverplayed = false

func _on_back_button_pressed() -> void:
	deselect.play()
	LoadManager.load_scene("res://scenes/menu/main_menu.tscn")
	ModeManager.is_story = false
	ModeManager.isin_worldmap = false


func _on_save_file_1_pressed() -> void:
	select.play()
	choose_savefile1 = true
	if !FileAccess.file_exists("user://savefiles/shime_story_savefile1.tres"):
		new_game_screen.show()
	else:
		current_save_screen.show()
		world_text.text = SaveFileManager.data_dic["currentworld"]
		lives_count.text = str(SaveFileManager.data_dic["maxlives"])
		tri_amount.text = str(SaveFileManager.data_dic["maxtriangles"])

func _on_yes_button_pressed() -> void:
	if choose_savefile1:
		ModeManager.is_savefile1 = true
	ModeManager.isin_worldmap = true
	StoryManager.making_newsave = true
	player_amount.show()
	select.play()


func _on_no_button_pressed() -> void:
	deselect.play()
	new_game_screen.hide()
	if StoryManager.making_newsave:
		StoryManager.making_newsave = false


func _on_back_button_current_pressed() -> void:
	deselect.play()
	current_save_screen.hide()


func _on_go_button_pressed() -> void:
	if choose_savefile1:
		ModeManager.is_savefile1 = true
	ModeManager.isin_worldmap = true
	LoadManager.load_scene("res://scenes/menu/character_select.tscn")
	if StoryManager.making_newsave && FileAccess.file_exists("user://savefiles/shime_story_savefile1.tres"):
		DirAccess.remove_absolute("user://savefiles/shime_story_savefile1.tres")
		reset_save()
	select.play()


func _on_continue_button_pressed() -> void:
	if choose_savefile1:
		ModeManager.is_savefile1 = true
	ModeManager.isin_worldmap = true
	player_amount.show()
	select.play()


func _on_new_button_pressed() -> void:
	select.play()
	new_game_screen.show()


func _on_player_amount_one_pressed() -> void:
	select.play()
	ModeManager.is_multiplayer = false
	ModeManager.multi_2players = false
	ModeManager.multi_3players = false
	ModeManager.multi_4players = false
	player_amount_one.disabled = true
	player_amount_three.disabled = false
	player_amount_two.disabled = false
	player_amount_four.disabled = false
	go_button_players.show()
	print("It's now One Player")
	print("Multiplayer Mode: " + str(ModeManager.is_multiplayer))
	print("2 Players Mode: " + str(ModeManager.multi_2players))
	print("3 Players Mode: " + str(ModeManager.multi_3players))
	print("4 Players Mode: " + str(ModeManager.multi_4players))


func _on_player_amount_two_pressed() -> void:
	select.play()
	ModeManager.is_multiplayer = true
	ModeManager.multi_2players = true
	ModeManager.multi_3players = false
	ModeManager.multi_4players = false
	player_amount_one.disabled = false
	player_amount_three.disabled = false
	player_amount_two.disabled = true
	player_amount_four.disabled = false
	go_button_players.show()
	print("It's now Two Players")
	print("Multiplayer Mode: " + str(ModeManager.is_multiplayer))
	print("2 Players Mode: " + str(ModeManager.multi_2players))
	print("3 Players Mode: " + str(ModeManager.multi_3players))
	print("4 Players Mode: " + str(ModeManager.multi_4players))


func _on_player_amount_three_pressed() -> void:
	select.play()
	ModeManager.is_multiplayer = true
	ModeManager.multi_2players = false
	ModeManager.multi_3players = true
	ModeManager.multi_4players = false
	player_amount_one.disabled = false
	player_amount_three.disabled = true
	player_amount_two.disabled = false
	player_amount_four.disabled = false
	go_button_players.show()
	print("It's now Three Players")
	print("Multiplayer Mode: " + str(ModeManager.is_multiplayer))
	print("2 Players Mode: " + str(ModeManager.multi_2players))
	print("3 Players Mode: " + str(ModeManager.multi_3players))
	print("4 Players Mode: " + str(ModeManager.multi_4players))

func _on_player_amount_four_pressed() -> void:
	select.play()
	ModeManager.is_multiplayer = true
	ModeManager.multi_2players = false
	ModeManager.multi_3players = false
	ModeManager.multi_4players = true
	player_amount_one.disabled = false
	player_amount_three.disabled = false
	player_amount_two.disabled = false
	player_amount_four.disabled = true
	go_button_players.show()
	print("It's now Four Players")
	print("Multiplayer Mode: " + str(ModeManager.is_multiplayer))
	print("2 Players Mode: " + str(ModeManager.multi_2players))
	print("3 Players Mode: " + str(ModeManager.multi_3players))
	print("4 Players Mode: " + str(ModeManager.multi_4players))

func _on_back_button_players_pressed() -> void:
	deselect.play()
	player_amount.hide()


func _on_go_button_players_pressed() -> void:
	if StoryManager.making_newsave && FileAccess.file_exists("user://savefiles/shime_story_savefile1.tres"):
		DirAccess.remove_absolute("user://savefiles/shime_story_savefile1.tres")
		reset_save()
	select.play()
	LoadManager.load_scene("res://scenes/menu/character_select.tscn")

func reset_save():
		if ModeManager.is_savefile1:
			SaveFileManager.update_data(
			SaveFileManager.currentworld, 
			SaveFileManager.currentplayerlives,
			SaveFileManager.currentplayerlivest,
			SaveFileManager.maxcurrentlives,
			SaveFileManager.trianglestotal,
			SaveFileManager.trianglestotalt,
			SaveFileManager.trianglestotalh,
			SaveFileManager.maxtrianglestotal)

			SaveFileManager.currentworld = "world1"
			SaveFileManager.currentplayerlives = 3
			SaveFileManager.currentplayerlivest = 0
			SaveFileManager.maxcurrentlives = 3
			SaveFileManager.trianglestotal = 0
			SaveFileManager.trianglestotalt = 0
			SaveFileManager.trianglestotalh = 0
			SaveFileManager.maxtrianglestotal = 0

			SaveFileManager.world1_tutorial_dic["trianglecollected1"] = false
			SaveFileManager.world1_tutorial_dic["trianglecollected2"] = false
			SaveFileManager.world1_tutorial_dic["trianglecollected3"] = false
			SaveFileManager.world1_tutorial_dic["trianglecollected4"] = false
			SaveFileManager.world1_tutorial_dic["hasbeencompleted"] = false

			SaveFileManager.world1_level1_dic["unlocked"] = false
			SaveFileManager.world1_level1_dic["trianglecollected1"] = false
			SaveFileManager.world1_level1_dic["trianglecollected2"] = false
			SaveFileManager.world1_level1_dic["trianglecollected3"] = false
			SaveFileManager.world1_level1_dic["trianglecollected4"] = false
			SaveFileManager.world1_level1_dic["hasbeencompleted"] = false

			SaveFileManager.world1_level2_dic["unlocked"] = false
			SaveFileManager.world1_level2_dic["trianglecollected1"] = false
			SaveFileManager.world1_level2_dic["trianglecollected2"] = false
			SaveFileManager.world1_level2_dic["trianglecollected3"] = false
			SaveFileManager.world1_level2_dic["trianglecollected4"] = false
			SaveFileManager.world1_level2_dic["hasbeencompleted"] = false

			SaveFileManager.world1_boss_dic["unlocked"] = false
			SaveFileManager.world1_boss_dic["hasbeencompleted"] = false

			SaveFileManager.world2_level1_dic["trianglecollected1"] = false
			SaveFileManager.world2_level1_dic["trianglecollected2"] = false
			SaveFileManager.world2_level1_dic["trianglecollected3"] = false
			SaveFileManager.world2_level1_dic["trianglecollected4"] = false
			SaveFileManager.world2_level1_dic["hasbeencompleted"] = false

			SaveFileManager.world2_level2_dic["unlocked"] = false
			SaveFileManager.world2_level2_dic["trianglecollected1"] = false
			SaveFileManager.world2_level2_dic["trianglecollected2"] = false
			SaveFileManager.world2_level2_dic["trianglecollected3"] = false
			SaveFileManager.world2_level2_dic["trianglecollected4"] = false
			SaveFileManager.world2_level2_dic["hasbeencompleted"] = false

			SaveFileManager.world2_level3_dic["unlocked"] = false
			SaveFileManager.world2_level3_dic["trianglecollected1"] = false
			SaveFileManager.world2_level3_dic["trianglecollected2"] = false
			SaveFileManager.world2_level3_dic["trianglecollected3"] = false
			SaveFileManager.world2_level3_dic["trianglecollected4"] = false
			SaveFileManager.world2_level3_dic["hasbeencompleted"] = false

			SaveFileManager.world2_boss_dic["unlocked"] = false
			SaveFileManager.world2_boss_dic["hasbeencompleted"] = false

			SaveFileManager.world_unlocks_dic["world2unlocked"] = false
			SaveFileManager.world_unlocks_dic["recentlyunlocked_world2"] = false
			SaveFileManager.world_unlocks_dic["world3unlocked"] = false
			SaveFileManager.world_unlocks_dic["world4unlocked"] = false
			SaveFileManager.world_unlocks_dic["world5unlocked"] = false
			SaveFileManager.world_unlocks_dic["world6unlocked"] = false
			SaveFileManager.world_unlocks_dic["world7unlocked"] = false
			SaveFileManager.world_unlocks_dic["world8unlocked"] = false

			SaveFileManager.update_w1_tut(
				SaveFileManager.world1_tutorial_dic["trianglecollected1"], 
				SaveFileManager.world1_tutorial_dic["trianglecollected2"], 
				SaveFileManager.world1_tutorial_dic["trianglecollected3"],
				SaveFileManager.world1_tutorial_dic["trianglecollected4"],
				SaveFileManager.world1_tutorial_dic["hasbeencompleted"])

			SaveFileManager.update_w1_lv1(
				SaveFileManager.world1_level1_dic["unlocked"],
				SaveFileManager.world1_level1_dic["trianglecollected1"], 
				SaveFileManager.world1_level1_dic["trianglecollected2"], 
				SaveFileManager.world1_level1_dic["trianglecollected3"],
				SaveFileManager.world1_level1_dic["trianglecollected4"],
				SaveFileManager.world1_level1_dic["hasbeencompleted"])

			SaveFileManager.update_w1_lv2(
				SaveFileManager.world1_level2_dic["unlocked"],
				SaveFileManager.world1_level2_dic["trianglecollected1"], 
				SaveFileManager.world1_level2_dic["trianglecollected2"], 
				SaveFileManager.world1_level2_dic["trianglecollected3"],
				SaveFileManager.world1_level2_dic["trianglecollected4"],
				SaveFileManager.world1_level2_dic["hasbeencompleted"])

			SaveFileManager.update_w1_boss(
				SaveFileManager.world1_boss_dic["unlocked"],
				SaveFileManager.world1_boss_dic["hasbeencompleted"])

			SaveFileManager.update_w2_lv1(
				SaveFileManager.world2_level1_dic["trianglecollected1"], 
				SaveFileManager.world2_level1_dic["trianglecollected2"], 
				SaveFileManager.world2_level1_dic["trianglecollected3"],
				SaveFileManager.world2_level1_dic["trianglecollected4"],
				SaveFileManager.world2_level1_dic["hasbeencompleted"])

			SaveFileManager.update_w2_lv2(
				SaveFileManager.world2_level2_dic["unlocked"],
				SaveFileManager.world2_level2_dic["trianglecollected1"], 
				SaveFileManager.world2_level2_dic["trianglecollected2"], 
				SaveFileManager.world2_level2_dic["trianglecollected3"],
				SaveFileManager.world2_level2_dic["trianglecollected4"],
				SaveFileManager.world2_level2_dic["hasbeencompleted"])

			SaveFileManager.update_w2_lv3(
				SaveFileManager.world2_level3_dic["unlocked"],
				SaveFileManager.world2_level3_dic["trianglecollected1"], 
				SaveFileManager.world2_level3_dic["trianglecollected2"], 
				SaveFileManager.world2_level3_dic["trianglecollected3"],
				SaveFileManager.world2_level3_dic["trianglecollected4"],
				SaveFileManager.world2_level3_dic["hasbeencompleted"])

			SaveFileManager.update_w2_boss(
				SaveFileManager.world2_boss_dic["unlocked"],
				SaveFileManager.world2_boss_dic["hasbeencompleted"])
			
			SaveFileManager.update_world_unlocks_dic(
				SaveFileManager.world_unlocks_dic["world2unlocked"],
				SaveFileManager.world_unlocks_dic["recentlyunlocked_world2"],
				SaveFileManager.world_unlocks_dic["world3unlocked"],
				SaveFileManager.world_unlocks_dic["world4unlocked"],
				SaveFileManager.world_unlocks_dic["world5unlocked"],
				SaveFileManager.world_unlocks_dic["world6unlocked"],
				SaveFileManager.world_unlocks_dic["world7unlocked"],
				SaveFileManager.world_unlocks_dic["world8unlocked"])
		SaveGame.save_game()
