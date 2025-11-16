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
			$Background/Folders/Label.text = "Tutorial Cosas"
			$Background/Folders2/Label.text = "Juegos"
			$Background/Folders3/Label.text = "Los secretos de la pelota azul de prueba"
			$Background/File/Label.text = "EscalarEscalarEscalar.tpl"
			$Background/File2/Label.text = "Casi ahí.bin"
			$Background/StickyNotes/TextFit/Label.text = "¡Cuidado! ¡Es Monstequare!
Estate atento al cuadrado verde que escupirá.
Es el único que no te hace daño y que debes agarrar manteniendo pulsada la tecla [X] (Botón de Agarrar).
Luego, cuando estés quieto, suéltalo para lanzárselo de vuelta."
		"french":
			$Background/Folders/Label.text = "Tutoriel
Trucs"
			$Background/Folders2/Label.text = "Jeux"
			$Background/Folders3/Label.text = "Les secrets de Blue Test Ball"
			$Background/File/Label.text = "GrimperGrimperGrimper.tpl"
			$Background/File2/Label.text = "Presque là.bin"
			$Background/StickyNotes/TextFit/Label.text = "Attention ! C'est Monstequare !
Surveillez le carré vert qu'il va cracher.
C'est le seul qui ne vous fait pas de mal et que vous devez attraper en maintenant la touche [X] enfoncée (bouton d'attraper).
Puis, une fois immobile, lâchez prise pour lui renvoyer l'objet !"
		"italian":
			$Background/Folders/Label.text = "Tutorial Cose"
			$Background/Folders2/Label.text = "Giochi"
			$Background/Folders3/Label.text = "I segreti della pallina blu da test"
			$Background/File/Label.text = "ArrampicatiArrampicatiArrampicati.tpl"
			$Background/File2/Label.text = "QuasiLì.bin"
			$Background/StickyNotes/TextFit/Label.text = "Attenzione! È Monstequare!
Tenete d'occhio il quadrato verde che sputerà.
È quello che non ti fa male e che richiede di afferrare tenendo premuto il tasto [X] (pulsante Afferra).
Poi, stando fermi, rilasciate il tasto per rilanciarglielo contro!"
		"german":
			$Background/Folders/Label.text = "Anleitung
Zeugs"
			$Background/Folders2/Label.text = "Spiele"
			$Background/Folders3/Label.text = "Die Geheimnisse des blauen Testballs"
			$Background/File/Label.text = "KletternKletternKlettern.tpl"
			$Background/File2/Label.text = "FastDa.bin"
			$Background/StickyNotes/TextFit/Label.text = "Oh je! Es ist Monstequare!
Halten Sie Ausschau nach dem grünen Quadrat, das er ausspucken wird.
Es ist dasjenige, das dir nicht wehtut und bei dem du es durch Gedrückthalten der [X]-Taste (Greifknopf) greifen musst.
Lass es dann los, während du stillstehst, um es direkt auf ihn zurückzuwerfen!"
		"japanese":
			$Background/Folders/Label.text = "チュートリアル
素材"
			$Background/Folders2/Label.text = "ゲーム"
			$Background/Folders3/Label.text = "ブルーテストボールの
秘密"
			$Background/File/Label.text = "クライムクライムクライム.tpl"
			$Background/File2/Label.text = "ほぼそこ.bin"
			$Background/StickyNotes/TextFit/Label.text = "うわっ！モンスタークアだ！
彼が吐き出す緑の四角に注意して。
それはあなたを傷つけないもので、[X]キー（掴むボタン）を押し続けて掴む必要がある。
そして、立ち止まったときに離して、彼に向かって投げ返そう！"
			$UI/GUI/BossUIBase/BossHealth/BossName.text = "モンスタークア"
		_:
			return
			#Just English.

func _process(delta: float) -> void:
	if ModeManager.is_savefile1:
		if LevelsManager.levelname == "boss_mostequare" && ModeManager.is_story:
			if game_manager.startouched:
				SaveFileManager.world1_boss_dic["hasbeencompleted"] = true
				print("Boss been defeated:" + SaveFileManager.world1_boss_dic["hasbeencompleted"])
				print("World 2 Unlocked!:" + SaveFileManager.world_unlocks_dic["world2unlocked"])
				game_manager.startouched = false
