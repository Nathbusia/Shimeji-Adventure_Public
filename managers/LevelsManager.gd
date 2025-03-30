extends Node

var levelname = ""
var leveldisplay = ""
var worldname = ""
var level = null
var world = null
var is_mod = false
var is_bossbattle : bool

func _process(delta):
	if worldname == null:
		worldname = "testlevel"
	if levelname == null:
		levelname = "testlevel1"
