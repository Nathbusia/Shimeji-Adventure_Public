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
@onready var flying_windows_pack: ParallaxBackground = $BackgroundBegin/FlyingWindowsPack

@onready var chat_detection: Area2D = $SceneObjects/ChatDetection
@onready var clerk_clara: AnimatableBody2D = $"SceneObjects/Clerk Clara/ClerkClara"

@onready var moving_platform: Node2D = $MovingPlatform

@onready var orb_hole_blue: AnimatableBody2D = $SceneObjects/OrbHole_Blue
@onready var orb_hole_red: AnimatableBody2D = $SceneObjects/OrbHole_Red
@onready var orb_hole_green: AnimatableBody2D = $SceneObjects/OrbHole_Green
@onready var orb_ball_blue: RigidBody2D = $SceneObjects/OrbBall_Blue
@onready var orb_ball_red: RigidBody2D = $SceneObjects/OrbBall_Red
@onready var orb_ball_green: RigidBody2D = $SceneObjects/OrbBall_Green

@onready var website_vertical: AnimatableBody2D = $SceneObjects/Website_Vertical
@onready var advertise_ment_fnfpnm: AnimatableBody2D = $SceneObjects/AdvertiseMent_FNFPNM
@onready var advertise_ment_rush: AnimatableBody2D = $SceneObjects/AdvertiseMent_Rush
@onready var advertise_ment_mohawk: AnimatableBody2D = $SceneObjects/AdvertiseMent_Mohawk

@onready var reset_vertical: Marker2D = $SceneObjects/ResetPosition/ResetVertical
@onready var reset_windows_a: Marker2D = $SceneObjects/ResetPosition/ResetWindowsA
@onready var reset_windows_b: Marker2D = $SceneObjects/ResetPosition/ResetWindowsB
@onready var reset_windows_c: Marker2D = $SceneObjects/ResetPosition/ResetWindowsC

@onready var reset_orb_blue: Marker2D = $SceneObjects/ResetPosition/ResetOrb_Blue
@onready var reset_orb_red: Marker2D = $SceneObjects/ResetPosition/ResetOrb_Red
@onready var reset_orb_green: Marker2D = $SceneObjects/ResetPosition/ResetOrb_Green
@onready var fall_trigger: Area2D = $SceneObjects/FallTrigger
@onready var teleporter_door_3: AnimatableBody2D = $SceneObjects/TeleporterDoor3
@onready var collision_shape_2d_teleporter: CollisionShape2D = $SceneObjects/TeleporterDoor3/Trigger/CollisionShape2D
@onready var collision_shape_2d_chat: CollisionShape2D = $SceneObjects/ChatDetection/CollisionShape2D

@onready var interfly: Node2D = $SceneObjects/Interfly


var orb_found = 0

func _ready() -> void:
	Dialogic.signal_event.connect(DialogicSignal)
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
			$BackgroundBegin/StickyNotes/TextFit/Label.text = "¡¡CUIDADO!! --> 
¡Estos bichos azules son los Flownets! Son el único enemigo que no se puede derrotar. 
¡Evítalos a toda costa!"
		"french":
			$BackgroundBegin/StickyNotes/TextFit/Label.text = "ATTENTION !! --> 
Ces créatures bleues sont les Flownets ! Ce sont les seuls ennemis qu'on ne peut pas vaincre. 
Évitez-les à tout prix !"
		"italian":
			$BackgroundBegin/StickyNotes/TextFit/Label.text = "ATTENZIONE!! -->
Questi critters blu sono i Flownets! Sono l'unico nemico che non può essere sconfitto. 
Evitali a tutti i costi!"
		"german":
			$BackgroundBegin/StickyNotes/TextFit/Label.text = "AUFPASSEN!! --> 
Diese blauen Kreaturen sind die Flownets! Sie sind die einzigen Gegner, die nicht besiegt werden können. 
Vermeiden Sie sie unbedingt!"
		"japanese":
			$BackgroundBegin/StickyNotes/TextFit/Label.text = "気をつけて！！ -->
青いこいつらはフローネットだ！こいつらは倒せない唯一の敵なんだ。
絶対に避けろ！"
		_:
			return
			#As usual... English.
func _process(delta: float) -> void:
	
	var overlapping_objects = $SceneObjects/RespawnOrb.get_overlapping_areas()
		
	for area in overlapping_objects:
		if area.get_parent().is_in_group("orb_blue"):
			orb_ball_blue.global_position = reset_orb_blue.global_position
		if area.get_parent().is_in_group("orb_red"):
			orb_ball_red.global_position = reset_orb_red.global_position
		if area.get_parent().is_in_group("orb_green"):
			orb_ball_green.global_position = reset_orb_green.global_position
	
	if orb_hole_blue.has_inserted:
		orb_found += 1
		orb_hole_blue.has_inserted = false #So it won't repeat, and keep adding up.
		print("Orb Ball Found:" + str(orb_found))
	if orb_hole_red.has_inserted:
		orb_found += 1
		orb_hole_red.has_inserted = false #So it won't repeat, and keep adding up.
		print("Orb Ball Found:" + str(orb_found))
	if orb_hole_green.has_inserted:
		orb_found += 1
		orb_hole_green.has_inserted = false #So it won't repeat, and keep adding up.
		print("Orb Ball Found:" + str(orb_found))

	if orb_found == 3:
		clerk_clara.open_sesame()

	if ModeManager.is_story:
		if ModeManager.is_savefile1:
			if LevelsManager.levelname == "world2_level2" && ModeManager.is_story:
				if game_manager.got_triangle1:
					if SaveFileManager.world2_level2_dic["trianglecollected1"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle1 = false
					SaveFileManager.world2_level2_dic["trianglecollected1"] = true
				if game_manager.got_triangle2:
					if SaveFileManager.world2_level2_dic["trianglecollected2"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle2 = false
					SaveFileManager.world2_level2_dic["trianglecollected2"] = true
				if game_manager.got_triangle3:
					if SaveFileManager.world2_level2_dic["trianglecollected3"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle3 = false
					SaveFileManager.world2_level2_dic["trianglecollected3"] = true
				if game_manager.got_triangle4:
					if SaveFileManager.world2_level2_dic["trianglecollected4"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle4 = false
					SaveFileManager.world2_level2_dic["trianglecollected4"] = true
				if game_manager.startouched:
					SaveFileManager.world2_level2_dic["hasbeencompleted"] = true
					SaveFileManager.world2_level3_dic["unlocked"] = true
					game_manager.startouched = false


func _on_chat_detection_body_entered(body: Node2D) -> void:
		clerk_clara.player_in_zone = true
		if orb_found == 1:
			clerk_clara.found_one = true
			clerk_clara.introduction = false
		if orb_found == 2:
			clerk_clara.found_two = true
			clerk_clara.found_one = false
			clerk_clara.introduction = false
		if orb_found == 3:
			clerk_clara.found_three = true
			clerk_clara.found_two = false
			clerk_clara.found_one = false
			clerk_clara.introduction = false
		if orb_found == 0:
			clerk_clara.introduction = true
		print("Is in Zone:" + str(clerk_clara.player_in_zone))
		print("Introduction:" + str(clerk_clara.introduction))
		print("Orb Ball One:" + str(clerk_clara.found_one))
		print("Orb Ball Two:" + str(clerk_clara.found_two))
		print("Orb Ball All:" + str(clerk_clara.found_three))


func _on_chat_detection_body_exited(body: Node2D) -> void:
		clerk_clara.player_in_zone = false
		if orb_found == 1:
			clerk_clara.found_one = false
		if orb_found == 2:
			clerk_clara.found_two = false
		if orb_found == 3:
			clerk_clara.found_three = false
		else:
			clerk_clara.introduction = false
		print("Is in Zone:" + str(clerk_clara.player_in_zone))
		print("Introduction:" + str(clerk_clara.introduction))
		print("Orb Ball One:" + str(clerk_clara.found_one))
		print("Orb Ball Two:" + str(clerk_clara.found_two))
		print("Orb Ball All:" + str(clerk_clara.found_three))


func _on_reset_windows_pressed() -> void:
	website_vertical.global_position = reset_vertical.global_position


func _on_reset_windows_2_pressed() -> void:
	advertise_ment_fnfpnm.global_position = reset_windows_a.global_position
	advertise_ment_rush.global_position = reset_windows_b.global_position
	advertise_ment_mohawk.global_position = reset_windows_c.global_position


func _on_respawn_orb_body_entered(body: RigidBody2D) -> void:
	if (body.name == "OrbBall_Blue"):
		orb_ball_blue.global_position = reset_orb_blue.global_position
	if (body.name == "OrbBall_Red"):
		orb_ball_red.global_position = reset_orb_red.global_position
	if (body.name == "OrbBall_Green"):
		orb_ball_green.global_position = reset_orb_green.global_position
		print("Green Orb Ball Respawned")

func DialogicSignal(argument:String):
	if argument == "gain_access":
		collision_shape_2d_teleporter.disabled = false
		collision_shape_2d_chat.disabled = true


func _on_interfly_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly.level2_end = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly.level2_end = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly.level2_end = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly.level2_end = true
