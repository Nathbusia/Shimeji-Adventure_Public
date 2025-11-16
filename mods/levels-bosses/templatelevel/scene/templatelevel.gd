extends Node
@onready var secret_triangle: Area2D = $SceneObjects/SecretTriangles/SecretTriangle
@onready var secret_triangle_2: Area2D = $SceneObjects/SecretTriangles/SecretTriangle2
@onready var secret_triangle_3: Area2D = $SceneObjects/SecretTriangles/SecretTriangle3
@onready var secret_triangle_4: Area2D = $SceneObjects/SecretTriangles/SecretTriangle4
@onready var finish_star: Area2D = $SceneObjects/FinishStar
@onready var score_numbers_life_t: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeT
@onready var score_numbers_life_dark_t: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkT
@onready var score_numbers_life_u: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeU
@onready var score_numbers_life_dark_u: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkU

@onready var game_manager: GameManager = $GameManager
@onready var multiplayer_cam: Camera2D = $MultiplayerCam
@onready var tile_map_layer: TileMapLayer = $SceneObjects/TileMap/TileMapLayer

@export var multilingual : bool #If the Level supports Multilingual.

func _ready() -> void:
	print_tree_pretty()
	ModeManager.isin_worldmap = false
	if ModeManager.is_story:
		if ModeManager.is_savefile1:
			if SaveFileManager.currentplayerlives == 1 or SaveFileManager.currentplayerlives == 2 or SaveFileManager.currentplayerlives == 3 or SaveFileManager.currentplayerlives == 4 or SaveFileManager.currentplayerlives == 5 or SaveFileManager.currentplayerlives == 6 or SaveFileManager.currentplayerlives == 7 or SaveFileManager.currentplayerlives == 8 or SaveFileManager.currentplayerlives == 9:
				score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
			if SaveFileManager.currentplayerlivest == 1 or SaveFileManager.currentplayerlivest == 2 or SaveFileManager.currentplayerlivest == 3 or SaveFileManager.currentplayerlivest == 4 or SaveFileManager.currentplayerlivest == 5 or SaveFileManager.currentplayerlivest == 6 or SaveFileManager.currentplayerlivest == 7 or SaveFileManager.currentplayerlivest == 8 or SaveFileManager.currentplayerlivest == 9:
				score_numbers_life_t.animation = str(SaveFileManager.currentplayerlivest)
				score_numbers_life_dark_t.animation = str(SaveFileManager.currentplayerlivest)
				score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
				
				
	#This code is for Multilingual Support.
	#The Label stuff for this Template Level are not required, and can be removed at your own will.
	if multilingual:
		match LanguageManager.language:
			"spanish":
				$TextureRect/Sign_Climb/Label.text = "Los escalables suelen estar ocultos en el juego.
Al aplicarlos a una pared, asegúrate de ocultarlos haciendo clic en ese ícono de 'Ojo'."
				$TextureRect/Sign_Spawn/Label.text = "Los nodos de CharacterSpawn suelen estar ocultos en el juego.
A pesar de ello, aún necesitarás el nodo ShimejiCharacter_Playable para que el nivel funcione, y para que el personaje aparezca correctamente cuando el nivel se cargue por primera vez."
			"french":
				$TextureRect/Sign_Climb/Label.text = "Les escalables sont généralement cachés dans le jeu.
Lorsque vous les appliquez à un mur, assurez-vous de les cacher en cliquant sur cette icône 'Œil'."
				$TextureRect/Sign_Spawn/Label.text = "Le nœud CharacterSpawn est généralement caché dans le jeu.

Malgré cela, vous aurez toujours besoin du nœud ShimejiCharacter_Playable pour que le niveau fonctionne et que le personnage apparaisse correctement lors du premier chargement du niveau."
			"italian":
				$TextureRect/Sign_Climb/Label.text = "Gli Scalabili sono solitamente nascosti nel gioco.
Quando ti applichi a un muro, assicurati di nasconderli cliccando su quell'icona 'Occhio'."
				$TextureRect/Sign_Spawn/Label.text = "Il nodo CharacterSpawn è solitamente nascosto nel gioco.
Nonostante ciò, avrai comunque bisogno del nodo 'ShimejiCharacter_Playable' affinché il livello funzioni e affinché il personaggio si generi correttamente quando il livello viene caricato per la prima volta."
			"german":
				$TextureRect/Sign_Climb/Label.text = "Die Kletterbaren sind normalerweise im Spiel versteckt.
Wenn du an eine Wand anlegst, stelle sicher, dass du sie versteckst, indem du auf das 'Auge'-Symbol klickst."
				$TextureRect/Sign_Spawn/Label.text = "Die CharacterSpawn-Knoten sind normalerweise im Spiel versteckt.
Dennoch benötigen Sie den 'ShimejiCharacter_Playable'-Knoten, damit das Level funktioniert und der Charakter beim ersten Laden des Levels korrekt erscheint."
			"japanese":
				$TextureRect/Sign_Climb/Label.text = "クライマブルは通常、ゲーム内で隠されています。
壁に適用する際は、その「目のアイコン」をクリックして隠すようにしてください。"
				$TextureRect/Sign_Spawn/Label.text = "CharacterSpawnノードは、通常ゲーム内では非表示になっています。
それでも、レベルを機能させ、レベルが初めてロードされたときにキャラクターが正しくスポーンするには、「ShimejiCharacter_Playable」ノードが必要になります。"
			_: #English/Other Languages
				pass
				
func _process(delta: float) -> void:
	if ModeManager.is_savefile1:
		if LevelsManager.levelname == "tutorial" && ModeManager.is_story:
			if game_manager.got_triangle1:
				if SaveFileManager.world1_tutorial_dic["trianglecollected1"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_tutorial_dic["trianglecollected1"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle1 = false
			if game_manager.got_triangle2:
				if SaveFileManager.world1_tutorial_dic["trianglecollected2"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_tutorial_dic["trianglecollected2"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle2 = false
			if game_manager.got_triangle3:
				if SaveFileManager.world1_tutorial_dic["trianglecollected3"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_tutorial_dic["trianglecollected3"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle3 = false
			if game_manager.got_triangle4:
				if SaveFileManager.world1_tutorial_dic["trianglecollected4"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_tutorial_dic["trianglecollected4"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle4 = false
			if game_manager.startouched:
				SaveFileManager.world1_tutorial_dic["hasbeencompleted"] = true
				SaveFileManager.world1_level1_dic["unlocked"] = true
				game_manager.startouched = false
		if LevelsManager.levelname == "level1" && ModeManager.is_story:
			if game_manager.got_triangle1:
				if SaveFileManager.world1_level1_dic["trianglecollected1"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_level1_dic["trianglecollected1"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle1 = false
			if game_manager.got_triangle2:
				if SaveFileManager.world1_level1_dic["trianglecollected2"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_level1_dic["trianglecollected2"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle2 = false
			if game_manager.got_triangle3:
				if SaveFileManager.world1_level1_dic["trianglecollected3"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_level1_dic["trianglecollected3"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle3 = false
			if game_manager.got_triangle4:
				if SaveFileManager.world1_level1_dic["trianglecollected4"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_level1_dic["trianglecollected4"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle4 = false
			if game_manager.startouched:
				SaveFileManager.world1_level1_dic["hasbeencompleted"] = true
				SaveFileManager.world1_level2_dic["unlocked"] = true
				game_manager.startouched = false
		if LevelsManager.levelname == "level2" && ModeManager.is_story:
			if game_manager.got_triangle1:
				if SaveFileManager.world1_level2_dic["trianglecollected1"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_level2_dic["trianglecollected1"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle1 = false
			if game_manager.got_triangle2:
				if SaveFileManager.world1_level2_dic["trianglecollected2"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_level2_dic["trianglecollected2"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle2 = false
			if game_manager.got_triangle3:
				if SaveFileManager.world1_level2_dic["trianglecollected3"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_level2_dic["trianglecollected3"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle3 = false
			if game_manager.got_triangle4:
				if SaveFileManager.world1_level2_dic["trianglecollected4"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.world1_level2_dic["trianglecollected4"] = true
				SaveFileManager.new_triangle()
				game_manager.got_triangle4 = false
			if game_manager.startouched:
				SaveFileManager.world1_level2_dic["hasbeencompleted"] = true
				SaveFileManager.world1_boss_dic["unlocked"] = true
				game_manager.startouched = false


func _on_fall_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "EmailShooter"):
		$SceneObjects/EmailShooter.global_position = $SceneObjects/EmailShooterPos.global_position
