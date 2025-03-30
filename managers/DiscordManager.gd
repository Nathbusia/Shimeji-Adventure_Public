extends Node

func _ready():
	DiscordRPC.app_id = 1355524757520515152
	DiscordRPC.state = "Booting Up the Game"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
