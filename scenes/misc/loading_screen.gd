extends Node2D

signal loading_screen_has_full_coverage

@onready var loading_screen: Panel = $LoadThing/LoadingScreen
@onready var loadanim: AnimationPlayer = $LoadThing/LoadingScreen/loadanim

func _ready() -> void:
	match LanguageManager.language:
		"spanish":
			$LoadThing/LoadingScreen/Label.text = "Cargando..."
		"french":
			$LoadThing/LoadingScreen/Label.text = "Chargement..."
		"italian":
			$LoadThing/LoadingScreen/Label.text = "Caricamento..."
		"german":
			$LoadThing/LoadingScreen/Label.text = "Wird geladen..."
		"japanese":
			$LoadThing/LoadingScreen/Label.text = "LOADING..."
		_:
			return
			#Engish once more

func _update_progress_bar(_new_value: float) -> void:
	pass
	
func _start_outro_animation() -> void:
	if loadanim.is_playing():
		await Signal(loadanim, "animation_finished")
	loadanim.play("end_load")
	if get_tree().paused == true:
		get_tree().paused = false
	await Signal(loadanim, "animation_finished")
	self.queue_free()
