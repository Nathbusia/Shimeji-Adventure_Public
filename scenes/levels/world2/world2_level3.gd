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

@onready var interfly: Node2D = $SceneObjects/Interfly

@onready var reset_windows_1: Marker2D = $ResetPosition/ResetWindows1
@onready var reset_windows_2: Marker2D = $ResetPosition/ResetWindows2
@onready var reset_windows_3: Marker2D = $ResetPosition/ResetWindows3


#Pete Voice Clips
#English
@onready var pete_vclips_01: AudioStreamPlayer = $PeteVC/English/pete_vclips_01
@onready var pete_vclips_02: AudioStreamPlayer = $PeteVC/English/pete_vclips_02
@onready var pete_vclips_03: AudioStreamPlayer = $PeteVC/English/pete_vclips_03
@onready var pete_vclips_04: AudioStreamPlayer = $PeteVC/English/pete_vclips_04
@onready var pete_vclips_05: AudioStreamPlayer = $PeteVC/English/pete_vclips_05
@onready var pete_vclips_06: AudioStreamPlayer = $PeteVC/English/pete_vclips_06
@onready var pete_vclips_07: AudioStreamPlayer = $PeteVC/English/pete_vclips_07
@onready var pete_vclips_08: AudioStreamPlayer = $PeteVC/English/pete_vclips_08
@onready var pete_vclips_09: AudioStreamPlayer = $PeteVC/English/pete_vclips_09
@onready var pete_vclips_10: AudioStreamPlayer = $PeteVC/English/pete_vclips_10


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
				
func _process(delta: float) -> void:
	var overlapping_objects = $SceneObjects/RespawnEmail.get_overlapping_areas()
		
	for area in overlapping_objects:
		if area.get_parent().is_in_group("email_shooter"):
			$SceneObjects/EmailShooter.global_position = $SceneObjects/EmailShooterPos.global_position
	
	if ModeManager.is_story:
		if ModeManager.is_savefile1:
			if LevelsManager.levelname == "world2_level3" && ModeManager.is_story:
				if game_manager.got_triangle1:
					if SaveFileManager.world2_level3_dic["trianglecollected1"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle1 = false
					SaveFileManager.world2_level3_dic["trianglecollected1"] = true
				if game_manager.got_triangle2:
					if SaveFileManager.world2_level3_dic["trianglecollected2"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle2 = false
					SaveFileManager.world2_level3_dic["trianglecollected2"] = true
				if game_manager.got_triangle3:
					if SaveFileManager.world2_level3_dic["trianglecollected3"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle3 = false
					SaveFileManager.world2_level3_dic["trianglecollected3"] = true
				if game_manager.got_triangle4:
					if SaveFileManager.world2_level3_dic["trianglecollected4"] == true:
						pass #So it won't add up if you already collected it before...
					SaveFileManager.new_triangle()
					game_manager.got_triangle4 = false
					SaveFileManager.world2_level3_dic["trianglecollected4"] = true
				if game_manager.startouched:
					SaveFileManager.world2_level3_dic["hasbeencompleted"] = true
					SaveFileManager.world2_boss_dic["unlocked"] = true
					game_manager.startouched = false

func DialogicSignal(argument:String):
	if argument == "pete_vc01":
		pete_vclips_01.play()
	if argument == "pete_vc02":
		pete_vclips_01.stop()
		pete_vclips_02.play()
	if argument == "pete_vc03":
		pete_vclips_02.stop()
		pete_vclips_03.play()
	if argument == "pete_vc04":
		pete_vclips_03.stop()
		pete_vclips_04.play()
	if argument == "pete_vc05":
		pete_vclips_04.stop()
		pete_vclips_05.play()
	if argument == "pete_vc06":
		pete_vclips_05.stop()
		pete_vclips_06.play()
	if argument == "pete_vc07":
		pete_vclips_06.stop()
		pete_vclips_07.play()
	if argument == "pete_vc08":
		pete_vclips_07.stop()
		pete_vclips_08.play()
	if argument == "pete_vc09":
		pete_vclips_08.stop()
		pete_vclips_09.play()
	if argument == "pete_vc10":
		pete_vclips_09.stop()
		pete_vclips_10.play()
	if argument == "vclip_lv3_04":
		pete_vclips_10.stop()


func _on_interfly_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		interfly.level3_end = true
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		interfly.level3_end = true
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		interfly.level3_end = true
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		interfly.level3_end = true


func _on_reset_windows_pressed() -> void:
	$SceneObjects/AdvertiseMent_StayAway.global_position = reset_windows_1.global_position


func _on_reset_windows_2_pressed() -> void:
	$SceneObjects/Website_Horizontal.global_position = reset_windows_2.global_position


func _on_reset_windows_3_pressed() -> void:
	$SceneObjects/Website_Horizontal2.global_position = reset_windows_3.global_position
