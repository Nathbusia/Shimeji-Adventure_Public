extends Node2D

var charactername = ""
var charactername_player2 = ""
var charactername_player3 = ""
var charactername_player4 = ""
var characterdisplay = ""
var shimejiCharacterPath = "res://scenes/characters/playable/" + charactername + "/shimeji_character_playable.tscn"
var shimejiCustomCharacterPath = "res://scenes/characters/playable/custom/" + charactername + "/shimeji_character_playable.tscn"
var character = null

var is_mod = false
var is_mod_p2 = false
var is_mod_p3 = false
var is_mod_p4 = false
