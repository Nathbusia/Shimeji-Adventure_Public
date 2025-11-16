extends AnimatableBody2D

@onready var orb_hole: AnimatedSprite2D = $OrbHole
@onready var orb_sounds: AnimationPlayer = $OrbSounds

var has_inserted = false
var activate = false

func _on_insert_hole_body_entered(body: Node2D) -> void:
	if (body.name == "OrbBall_Red"):
		orb_hole.play("insert")
		orb_sounds.play("activate")
		has_inserted = true
		activate = true
		body.got_inserted = true
