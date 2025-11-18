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
	
	if AltBgmManager.enabled:
		$SceneObjects/Level_BGM.stream = load("res://bgm/levels/world1/bgm_world1_level1_ytsafe.ogg")
		$SceneObjects/Level_BGM.play()
	else:
		pass
	
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
			$Background/StickyNotes/TextFit/Label.text = "¡Esta ventana es escalable! -->
Solo camina hacia ella, y luego usa las teclas de flecha arriba o abajo para escalar.
Puedes usar la tecla izquierda o presionar la barra espaciadora (botón de salto) para bajarte."
			$Background/StickyNotes2/TextFit/Label.text = "Esta ventana no se puede escalar.  
-->  
¡Impúlsate con fuerza en el resorte y luego realiza un doble salto para alcanzar esa altura!"
			$Background/StickyNotes3/TextFit/Label.text = "¡SLAM DASH ESOS RESORTES!!
(Boing) (Boing)"
			$Background/StickyNotes4/TextFit/Label.text = "Y hemos terminado por ahora. ¡Pasemos al siguiente nivel!
¡Nos vemos de nuevo! :)"
			$Background/StickyNotesPink/TextFit/Label.text = "Esta ventana se puede escalar por debajo.
-->
¡Salta sobre ella y usa las teclas de flecha izquierda o derecha para moverte! Y luego usa el Golpe Rápido para bajarte.
¡CUIDADO CON LAS PÚAS!"
			$Background/StickyNotesPink2/TextFit/Label.text = "Este cartel significa que puedes perder una vida al caerte.
¡Así que, cuidado por dónde pisas!"
			$Background/StickyNotesGreen/TextFit/Label.text = "Prueba a hacer un Slam Dash con este Gran Tirador, y luego realiza un doble salto.  
Supongo que hay algo allá arriba..."
		"french":
			$Background/Folders/Label.text = "Tutoriel
Trucs"
			$Background/Folders2/Label.text = "Jeux"
			$Background/Folders3/Label.text = "Les secrets de Blue Test Ball"
			$Background/File/Label.text = "GrimperGrimperGrimper.tpl"
			$Background/File2/Label.text = "Presque là.bin"
			$Background/StickyNotes/TextFit/Label.text = "Cette fenêtre est escaladable !
Il suffit de marcher vers elle, puis d'utiliser les flèches haut ou bas pour grimper !
Vous pouvez utiliser la touche gauche ou appuyer sur la barre d'espace (bouton de saut) pour sauter."
			$Background/StickyNotes2/TextFit/Label.text = "Cette fenêtre est infranchissable.

Faites un Slam Dash sur le Ressort, puis effectuez un double saut pour atteindre cette hauteur !"
			$Background/StickyNotes3/TextFit/Label.text = "SLAM DASH CES RESSORTS !! (Boing) (Boing)"
			$Background/StickyNotes4/TextFit/Label.text = "Et c'est tout pour maintenant. Passons au niveau suivant ! À bientôt ! :)"
			$Background/StickyNotesPink/TextFit/Label.text = "Cette fenêtre peut être grimpée en dessous.

Sautez dessus et utilisez les flèches gauche ou droite pour vous déplacer ! Puis utilisez Slam Dash pour descendre. ATTENTION AUX POINTES !"
			$Background/StickyNotesPink2/TextFit/Label.text = "Ce panneau signifie que vous pouvez perdre la vie en tombant.
Alors, faites attention où vous mettez les pieds !"
			$Background/StickyNotesGreen/TextFit/Label.text = "Essayez de faire un « Slam Dash » sur ce « Big Shooter », puis faites un double saut.
Je suppose qu'il y a quelque chose là-haut..."
		"italian":
			$Background/Folders/Label.text = "Tutorial Cose"
			$Background/Folders2/Label.text = "Giochi"
			$Background/Folders3/Label.text = "I segreti della pallina blu da test"
			$Background/File/Label.text = "ArrampicatiArrampicatiArrampicati.tpl"
			$Background/File2/Label.text = "QuasiLì.bin"
			$Background/StickyNotes/TextFit/Label.text = "Questa finestra è scalabile!
Basta avvicinarsi e poi usare i tasti freccia su o giù per arrampicarsi!
Puoi usare il tasto sinistro o premere la barra spaziatrice (pulsante salta) per saltare giù."
			$Background/StickyNotes2/TextFit/Label.text = "Questa finestra non può essere scalata.
Esegui Slam Dash sulla Molla, e poi effettua un doppio salto per raggiungere quell'altezza!"
			$Background/StickyNotes3/TextFit/Label.text = "SLAM! SALTA QUELLE MOLLE!! (Boing) (Boing)"
			$Background/StickyNotes4/TextFit/Label.text = "E abbiamo finito per ora. Passiamo al livello successivo! Ci vediamo di nuovo! :)"
			$Background/StickyNotesPink/TextFit/Label.text = "Questa finestra può essere scalata da sotto.
Salta su di essa e usa i tasti freccia sinistra o destra per muoverti! E poi usa Slam Dash per scendere.
ATTENZIONE AI CHIODI!"
			$Background/StickyNotesPink2/TextFit/Label.text = "Questo segno significa che si può perdere la vita cadendo.
Quindi, stai attento/a a dove metti i piedi!"
			$Background/StickyNotesGreen/TextFit/Label.text = "Prova a fare Slam Dash con questo Grande Shooter, e poi esegui un doppio salto.
Credo ci sia qualcosa lassù..."
		"german":
			$Background/Folders/Label.text = "Anleitung
Zeugs"
			$Background/Folders2/Label.text = "Spiele"
			$Background/Folders3/Label.text = "Die Geheimnisse des blauen Testballs"
			$Background/File/Label.text = "KletternKletternKlettern.tpl"
			$Background/File2/Label.text = "FastDa.bin"
			$Background/StickyNotes/TextFit/Label.text = "Dieses Fenster ist erklimmbar! --> 
Geh einfach darauf zu und benutze dann die Pfeiltasten nach oben oder unten, um zu klettern! 
Du kannst die linke Taste verwenden oder die Leertaste (Sprungtaste) drücken, um abzuhüpfen."
			$Background/StickyNotes2/TextFit/Label.text = "Dieses Fenster kann nicht erklommen werden.
-->
Spring mit einem Slam Dash und führe dann einen Doppelsprung aus, um diese Höhe zu erreichen!"
			$Background/StickyNotes3/TextFit/Label.text = "SLAM! DASH! DIESE FEDERN!! (Boing) (Boing)"
			$Background/StickyNotes4/TextFit/Label.text = "Und das war's für jetzt. Lass uns zur nächsten Stufe übergehen! Bis bald! :)"
			$Background/StickyNotesPink/TextFit/Label.text = "Dieses Fenster kann man unterkriechen.
-->
Springt darauf und benutzt die Pfeiltasten links oder rechts zur Fortbewegung! Und dann benutzt Slam Dash, um herunterzukommen. 
ACHTUNG VOR STACHELN!"
			$Background/StickyNotesPink2/TextFit/Label.text = "Dieses Schild bedeutet, dass man durch einen Sturz ein Leben verlieren kann.
Also, pass auf!"
			$Background/StickyNotesGreen/TextFit/Label.text = "Versuche, diesen großen Shooter mit einem Slam Dash zu treffen, und führe dann einen Doppelsprung aus.
Ich schätze, da oben ist was..."
		"japanese":
			$Background/Folders/Label.text = "チュートリアル
素材"
			$Background/Folders2/Label.text = "ゲーム"
			$Background/Folders3/Label.text = "ブルーテストボールの
秘密"
			$Background/File/Label.text = "クライムクライムクライム.tpl"
			$Background/File2/Label.text = "ほぼそこ.bin"
			$Background/StickyNotes/TextFit/Label.text = "この窓は登れる！ -->
ただ近づいて、上矢印キーまたは下矢印キーを使って登ってください！
左キーを使うか、スペースキー（ジャンプボタン）を押して降りることができます。"
			$Background/StickyNotes2/TextFit/Label.text = "この窓は登れません。
-->
バネの上でスラムダッシュし、その後ダブルジャンプでその高さに到達しましょう！"
			$Background/StickyNotes3/TextFit/Label.text = "スラムダッシュ！
バネを叩け！！
（ポン） （ポン）"
			$Background/StickyNotes4/TextFit/Label.text = "さて、今回はここまで。次のレベルに進みましょう！
またね！ :)"
			$Background/StickyNotesPink/TextFit/Label.text = "この窓の下をくぐれます。
-->
窓に飛び乗って左右の矢印キーで移動！ その後スラムダッシュで降りてください。
とげに注意！"
			$Background/StickyNotesPink2/TextFit/Label.text = "この標識は、転落すると命を落とす可能性があることを示しています。
ですから、足元に気をつけてください！"
			$Background/StickyNotesGreen/TextFit/Label.text = "このビッグシューターにスラムダッシュを決め、続けてダブルジャンプを決めよう。
どうやら上の方に何かあるようだ…"
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
