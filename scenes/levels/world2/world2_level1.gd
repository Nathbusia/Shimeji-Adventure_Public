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

@onready var mouse_press_button: TextureButton = $SceneObjects/Mechanics/MousePressButton
@onready var office_door: RigidBody2D = $SceneObjects/Mechanics/OfficeDoor
@onready var office_door_2: RigidBody2D = $SceneObjects/Mechanics/OfficeDoor2
@onready var interfly: Node2D = $SceneObjects/Interfly
@onready var interfly_2: Node2D = $SceneObjects/Interfly2
@onready var interfly_3: Node2D = $SceneObjects/Interfly3
@onready var interfly_4: Node2D = $SceneObjects/Interfly4
@onready var interfly_5: Node2D = $SceneObjects/Interfly5
@onready var interfly_6: Node2D = $SceneObjects/Interfly6
@onready var interfly_7: Node2D = $SceneObjects/Interfly7

@onready var sticknode: RigidBody2D = $SceneObjects/MeanBalls/Sticknode
@onready var sticknode_2: RigidBody2D = $SceneObjects/MeanBalls/Sticknode2
@onready var sticknode_3: RigidBody2D = $SceneObjects/MeanBalls/Sticknode3

@onready var reset_windows: TextureButton = $SceneObjects/Mechanics/ResetWindows
@onready var reset_windows_draggable_climbs: TextureButton = $SceneObjects/Mechanics/ResetWindows_DraggableClimbs
@onready var reset_windows_sticknode: TextureButton = $SceneObjects/Mechanics/ResetWindows_Sticknode
@onready var reset_windows_sticknode_2: TextureButton = $SceneObjects/Mechanics/ResetWindows_Sticknode2
@onready var reset_windows_sticknode_3: TextureButton = $SceneObjects/Mechanics/ResetWindows_Sticknode3
@onready var advertise_ment_fnfpnm: AnimatableBody2D = $SceneObjects/AdvertiseMent_FNFPNM
@onready var advertise_ment_rush: AnimatableBody2D = $SceneObjects/AdvertiseMent_Rush
@onready var advertise_ment_mohawk: AnimatableBody2D = $SceneObjects/AdvertiseMent_Mohawk
@onready var advertise_ment_fnfpnm_2: AnimatableBody2D = $SceneObjects/AdvertiseMent_FNFPNM2
@onready var website_vertical: AnimatableBody2D = $SceneObjects/Website_Vertical
@onready var website_vertical_2: AnimatableBody2D = $SceneObjects/Website_Vertical2
@onready var website_vertical_3: AnimatableBody2D = $SceneObjects/Website_Vertical3
@onready var website_vertical_4: AnimatableBody2D = $SceneObjects/Website_Vertical4
@onready var website_horizontal: AnimatableBody2D = $SceneObjects/Website_Horizontal

@onready var windows_pos_1a: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_1A
@onready var windows_pos_1b: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_1B
@onready var windows_pos_1c: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_1C
@onready var windows_pos_2a: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_2A
@onready var windows_pos_2b: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_2B
@onready var windows_pos_2c: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_2C
@onready var windows_pos_3: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_3
@onready var windows_pos_4: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_4
@onready var windows_pos_5: Marker2D = $SceneObjects/WindowsPosition/WindowsPos_5

@onready var orb_hole_blue: AnimatableBody2D = $SceneObjects/OrbHole_Blue
@onready var orb_hole_red: AnimatableBody2D = $SceneObjects/OrbHole_Red
@onready var orb_hole_green: AnimatableBody2D = $SceneObjects/OrbHole_Green


func _ready() -> void:
	print_tree_pretty()
	
	if AltBgmManager.enabled:
		$SceneObjects/Level_BGM.stream = load("res://bgm/levels/world2/bgm_world2_level1_ytsafe.ogg")
		$SceneObjects/Level_BGM.play()
	else:
		pass
	
	advertise_ment_fnfpnm.global_position = Vector2(3075,470)
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
			$Background/StickyNotes/TextFit/Label.text = "Las ventanas arrastrables no se moverán si estás de pie o tocándolas.
¡Haz espacio para que las ventanas arrastrables puedan... arrastrarse!

Si cometiste un error y no puedes alcanzar las ventanas arrastrables, haz clic en el botón «»reset»» para volver a colocarlas en su posición inicial."

			$Background/StickyNotes2/TextFit/Label.text = "Los puntos verdes son donde reaparecerán las ventanas arrastrables una vez que presiones el botón de Reiniciar.

Quizás quieras hacer algo de espacio antes de presionar el botón."
		"french":
			$Background/StickyNotes/TextFit/Label.text = "Les fenêtres déplaçables ne bougeront pas si vous vous tenez debout ou si vous les touchez.
Faites de la place pour que les fenêtres déplaçables puissent être... déplacées !

Si vous avez fait une erreur et que vous ne pouvez pas atteindre les fenêtres déplaçables, cliquez sur le bouton « reset » pour les repositionner comme elles étaient au départ !"
			$Background/StickyNotes2/TextFit/Label.text = "Les points verts indiquent l'endroit où les fenêtres déplaçables réapparaîtront après avoir appuyé sur le bouton Réinitialiser.

Vous voudrez peut-être faire de la place avant d'appuyer sur le bouton."
		"italian":
			$Background/StickyNotes/TextFit/Label.text = "Le finestre trascinabili non si spostano se sei in piedi o le stai toccando.
Fai spazio alle finestre trascinabili in modo che possano essere... trascinate!

Se hai commesso un errore e non riesci a raggiungere le finestre trascinabili, clicca sul pulsante “reset” per riposizionarle come all'inizio!"
			$Background/StickyNotes2/TextFit/Label.text = "I puntini verdi indicano dove le finestre trascinabili riappariranno dopo aver premuto il pulsante di Reset.

Potresti voler fare un po' di spazio prima di premere il pulsante."
		"german":
			$Background/StickyNotes/TextFit/Label.text = "Ziehbare Fenster lassen sich nicht verschieben, wenn Sie davor stehen oder sie berühren.
Schaffen Sie Platz, damit die ziehbaren Fenster auch wirklich gezogen werden können!

Wenn Sie einen Fehler gemacht haben und die ziehbaren Fenster nicht mehr erreichen können, klicken Sie auf die Schaltfläche „“Reset““, um sie wieder in ihre Ausgangsposition zu bringen!"
			$Background/StickyNotes2/TextFit/Label.text = "Die grünen Punkte sind die Stellen, an denen die verschiebbaren Fenster erneut erscheinen, sobald Sie die Reset-Taste drücken.

Sie sollten vielleicht etwas Platz schaffen, bevor Sie den Knopf drücken."
		"japanese":
			$Background/StickyNotes/TextFit/Label.text = "ドラッグ可能なウィンドウは、あなたが立っている状態や触れている状態では移動しません。
ドラッグ可能なウィンドウをスムーズにドラッグできるように、十分なスペースを確保してください！

もし誤ってドラッグ可能なウィンドウに手が届かない位置に移動させてしまった場合は、そこにある「Reset」ボタンをクリックして、元の位置に戻してください！"
			$Background/StickyNotes2/TextFit/Label.text = "緑のドットは、リセットボタンを押すと、ドラッグ可能なウィンドウが再出現する場所です。
ボタンを押す前に、少しスペースを作っておいた方が良いでしょう。"
		_:
			return
			#As usual... English.

func _process(delta: float) -> void:
	#Mechanics/Interactivity
	if mouse_press_button.activate:
		office_door.functioned = true
	
	if reset_windows.reset:
		advertise_ment_fnfpnm.global_position = windows_pos_1a.global_position
		advertise_ment_rush.global_position = windows_pos_1b.global_position
		advertise_ment_mohawk.global_position = windows_pos_1c.global_position
		reset_windows.reset = false
		print("Finished Resetting:" + str(reset_windows.reset))
		print("Finished Resetting (Global):" + str(advertise_ment_fnfpnm.global_position))
	if reset_windows_draggable_climbs.reset:
		website_vertical.global_position = windows_pos_2a.global_position
		website_vertical_2.global_position = windows_pos_2b.global_position
		website_horizontal.global_position = windows_pos_2c.global_position
		reset_windows_draggable_climbs.reset = false
	if reset_windows_sticknode.reset:
		advertise_ment_fnfpnm_2.global_position = windows_pos_3.global_position
		reset_windows_sticknode.reset = false
	if reset_windows_sticknode_2.reset:
		website_vertical_3.global_position = windows_pos_4.global_position
		reset_windows_sticknode_2.reset = false
	if reset_windows_sticknode_3.reset:
		website_vertical_4.global_position = windows_pos_5.global_position
		reset_windows_sticknode_3.reset = false
	
	if orb_hole_blue.has_inserted && orb_hole_red.has_inserted && orb_hole_green.has_inserted:
		office_door_2.functioned = true
	
	#Save Stuff (For Story Mode)
	if ModeManager.is_story:
		if ModeManager.is_savefile1:
			if LevelsManager.levelname == "world2_level1" && ModeManager.is_story:
				if game_manager.got_triangle1:
					if SaveFileManager.world2_level1_dic["trianglecollected1"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle1 = false
					SaveFileManager.world2_level1_dic["trianglecollected1"] = true
				if game_manager.got_triangle2:
					if SaveFileManager.world2_level1_dic["trianglecollected2"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle2 = false
					SaveFileManager.world2_level1_dic["trianglecollected2"] = true
				if game_manager.got_triangle3:
					if SaveFileManager.world2_level1_dic["trianglecollected3"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle3 = false
					SaveFileManager.world2_level1_dic["trianglecollected3"] = true
				if game_manager.got_triangle4:
					if SaveFileManager.world2_level1_dic["trianglecollected4"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle4 = false
					SaveFileManager.world2_level1_dic["trianglecollected4"] = true
				if game_manager.startouched:
					SaveFileManager.world2_level1_dic["hasbeencompleted"] = true
					SaveFileManager.world2_level2_dic["unlocked"] = true
					game_manager.startouched = false


func _on_area_2d_part_1_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly.dialouge_part1 = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly.dialouge_part1 = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly.dialouge_part1 = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly.dialouge_part1 = true

func _on_area_2d_part_2_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly_2.dialouge_part2 = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly_2.dialouge_part2 = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly_2.dialouge_part2 = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly_2.dialouge_part2 = true


func _on_area_2d_part_3_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly_3.dialouge_part3 = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly_3.dialouge_part3 = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly_3.dialouge_part3 = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly_3.dialouge_part3 = true


func _on_area_2d_part_4_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly_4.dialouge_part4 = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly_4.dialouge_part4 = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly_4.dialouge_part4 = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly_4.dialouge_part4 = true


func _on_area_2d_part_5_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly_5.dialouge_part5 = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly_5.dialouge_part5 = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly_5.dialouge_part5 = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly_5.dialouge_part5 = true


func _on_area_2d_part_6_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly_6.dialouge_part6 = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly_6.dialouge_part6 = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly_6.dialouge_part6 = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly_6.dialouge_part6 = true


func _on_area_2d_part_7_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly_7.dialouge_part7 = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly_7.dialouge_part7 = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly_7.dialouge_part7 = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly_7.dialouge_part7 = true
