extends AnimatableBody2D

@onready var vkey_anim: AnimationPlayer = $Vkey_Anim
@onready var teleport_point: Marker2D = $TeleportPoint
@onready var teleport_point_player_2: Marker2D = $TeleportPoint_Player2
@onready var teleport_point_player_3: Marker2D = $TeleportPoint_Player3
@onready var teleport_point_player_4: Marker2D = $TeleportPoint_Player4
@onready var teleport_transition: CanvasLayer = $TeleportTransition
@onready var black_screen_anim: AnimationPlayer = $BlackScreen_Anim
@onready var go_into: AudioStreamPlayer2D = $SFX/GoInto
@onready var go_outo: AudioStreamPlayer = $SFX/GoOuto
@onready var shimeji_character_playable: CharacterBody2D = $"../ShimejiCharacter_Playable"
@onready var shimeji_character_playable_player_2: CharacterBody2D = $"../ShimejiCharacter_Playable_Player2"
@onready var shimeji_character_playable_player_3: CharacterBody2D = $"../ShimejiCharacter_Playable_Player3"
@onready var shimeji_character_playable_player_4: CharacterBody2D = $"../ShimejiCharacter_Playable_Player4"


var is_teleporting = false
var is_in_zone = false

func _on_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"): #Only Player 1 can interact the Teleporter Door for all players.
		vkey_anim.play("popin")
		is_in_zone = true


func _on_trigger_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		vkey_anim.play("popout")
		is_in_zone = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("chat") && is_in_zone:
		shimeji_character_playable.is_incutscene = true
		if ModeManager.is_multiplayer:
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				shimeji_character_playable_player_2.is_incutscene = true
			if ModeManager.multi_3players || ModeManager.multi_4players:
				shimeji_character_playable_player_3.is_incutscene = true
			if ModeManager.multi_4players:
				shimeji_character_playable_player_4.is_incutscene = true
		teleport_transition.show()
		black_screen_anim.play("transition")

func transport():
	shimeji_character_playable.set_position(teleport_point.global_position)
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			shimeji_character_playable_player_2.set_position(teleport_point_player_2.global_position)
		if ModeManager.multi_3players || ModeManager.multi_4players:
			shimeji_character_playable_player_3.set_position(teleport_point_player_3.global_position)
		if ModeManager.multi_4players:
			shimeji_character_playable_player_4.set_position(teleport_point_player_4.global_position)

func end_transport():
	shimeji_character_playable.is_incutscene = false
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			shimeji_character_playable_player_2.is_incutscene = false
		if ModeManager.multi_3players || ModeManager.multi_4players:
			shimeji_character_playable_player_3.is_incutscene = false
		if ModeManager.multi_4players:
			shimeji_character_playable_player_4.is_incutscene = false
	teleport_transition.hide()


func playinto():
	go_into.play()

func playouto():
	go_outo.play()
