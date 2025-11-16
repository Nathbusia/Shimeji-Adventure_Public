extends Area2D
@onready var _1_up_sprite: AnimatedSprite2D = $"1upSprite"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var game_manager: GameManager = $"../../GameManager"
@onready var _1_up_sfx: AudioStreamPlayer = $"1upSFX"

var is_collected = false


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && not is_collected:
		_1_up_sprite.animation = "collecttext"
		animation_player.play("1uptext")
		_1_up_sfx.play()
		is_collected = true
		game_manager.add_lives()
		self.modulate = Color(body.charcolour)

	if (body.name == "ShimejiCharacter_Playable_Player2") && not is_collected:
		_1_up_sprite.animation = "collecttext"
		animation_player.play("1uptext")
		_1_up_sfx.play()
		is_collected = true
		game_manager.add_lives_player2()
		self.modulate = Color(body.charcolour)

	if (body.name == "ShimejiCharacter_Playable_Player3") && not is_collected:
		_1_up_sprite.animation = "collecttext"
		animation_player.play("1uptext")
		_1_up_sfx.play()
		is_collected = true
		game_manager.add_lives_player3()
		self.modulate = Color(body.charcolour)

	if (body.name == "ShimejiCharacter_Playable_Player4") && not is_collected:
		_1_up_sprite.animation = "collecttext"
		animation_player.play("1uptext")
		_1_up_sfx.play()
		is_collected = true
		game_manager.add_lives_player4()
		self.modulate = Color(body.charcolour)
	
func anim_end():
	is_collected = false
	queue_free()
