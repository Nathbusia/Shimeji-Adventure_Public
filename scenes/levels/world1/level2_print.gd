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
				
	match LanguageManager.language:
		"spanish":
			$Background/Folders2/Label.text = "Juegos"
			$Background/Folders3/Label.text = "Acción primaveral:
El videojuego"
			$Background/Folders4/Label.text = "Acción de escalada:
El videojuego"
			$Background/File2/Label.text = "Casi ahí.bin"
			$Background/StickyNotes/TextFit/Label.text = "¡¡BIENVENIDO DE NUEVO!!
¡Ya estás en el nivel 2!"
			$Background/StickyNotes4/TextFit/Label.text = "Alguien está esperando verte.
¡Vamos a ver quién es!
¡Buena suerte!"
			$Background/StickyNotesPink2/TextFit/Label.text = "¡¡BOING BOING DE NUEVO!!"
			$Background/StickyNotesGreen/TextFit/Label.text = "Hay numerosas plataformas móviles por aquí.
¡Algunas de ellas pueden ayudarte a darte impulso!"
		"french":
			$Background/Folders2/Label.text = "Jeux"
			$Background/Folders3/Label.text = "Action de printemps :
Le jeu vidéo"
			$Background/Folders4/Label.text = "Action d'escalade :
Le jeu vidéo"
			$Background/File2/Label.text = "Presque là.bin"
			$Background/StickyNotes/TextFit/Label.text = "BON RETOUR !
Vous êtes maintenant au niveau 2 !"
			$Background/StickyNotes4/TextFit/Label.text = "Quelqu'un vous attend.
Allons voir qui c'est !
Bonne chance !"
			$Background/StickyNotesPink2/TextFit/Label.text = "BOING BOING ENCORE UNE FOIS !!"
			$Background/StickyNotesGreen/TextFit/Label.text = "Il y a de nombreuses plateformes mobiles par ici.
Certaines d'entre elles peuvent vous aider à prendre de l'élan !"
		"italian":
			$Background/Folders2/Label.text = "Giochi"
			$Background/Folders3/Label.text = "Springs Action:
Il videogioco"
			$Background/Folders4/Label.text = "Climb Action:
Il videogioco"
			$Background/File2/Label.text = "QuasiLì.bin"
			$Background/StickyNotes/TextFit/Label.text = "BENTORNATO/A!!
Ora sei al livello 2!"
			$Background/StickyNotes4/TextFit/Label.text = "Qualcuno sta aspettando di vederti.
Andiamo a vedere chi è!
Buona fortuna!"
			$Background/StickyNotesPink2/TextFit/Label.text = "DI NUOVO BOING BOING!!"
			$Background/StickyNotesGreen/TextFit/Label.text = "Ci sono numerose piattaforme mobili qui intorno.
Alcune di esse possono aiutarti a prendere slancio!"
		"german":
			$Background/Folders2/Label.text = "Spiele"
			$Background/Folders3/Label.text = "Springs Action:
Das Videospiel"
			$Background/Folders4/Label.text = "Climb Action:
Das Videospiel"
			$Background/File2/Label.text = "FastDa.bin"
			$Background/StickyNotes/TextFit/Label.text = "WILLKOMMEN ZURÜCK!!
Du befindest dich jetzt in Level 2!"
			$Background/StickyNotes4/TextFit/Label.text = "Jemand wartet darauf, dich zu sehen.
Lass uns hingehen und nachsehen, wer es ist!
Viel Glück!"
			$Background/StickyNotesPink2/TextFit/Label.text = "SCHON WIEDER BOING BOING!!"
			$Background/StickyNotesGreen/TextFit/Label.text = "Hier gibt es zahlreiche bewegliche Plattformen.
Einige davon können dir helfen, Schwung zu gewinnen!"
		"japanese":
			$Background/Folders/Label.text = "スカイゾーン"
			$Background/Folders2/Label.text = "ゲーム"
			$Background/Folders3/Label.text = "スプリングスアクション：
ザ・ビデオゲーム"
			$Background/Folders4/Label.text = "クライムアクション：
ザ・ビデオゲーム"
			$Background/File/Label.text = "敵はキー.bin"
			$Background/File2/Label.text = "ほぼそこ.bin"
			$Background/StickyNotes/TextFit/Label.text = "おかえりなさい！
あなたはレベル2に到達しました！"
			$Background/StickyNotes4/TextFit/Label.text = "誰かがあなたに会うのを待っています。
誰なのか見に行きましょう！
幸運を！"
			$Background/StickyNotesPink2/TextFit/Label.text = "またボインボイン!!"
			$Background/StickyNotesGreen/TextFit/Label.text = "この辺りには動くプラットフォームがたくさんあります。
その中にはあなたに勢いを与えるのに役立つものもあります!"
		_:
			return
			#Just English.

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
