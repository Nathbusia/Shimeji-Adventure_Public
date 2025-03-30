extends Node

var currentlives = 3
var currentlivest = 0
var maxcurrentlives = 3

func _ready() -> void:
	if currentlives == null:
		currentlives = 3
	if currentlivest == null:
		currentlivest = 0
