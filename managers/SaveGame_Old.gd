extends Node

var json = JSON.new()
var savefile1_path = "user://savefiles/shime_story_savefile1.json"
var savefile2_path = "user://savefiles/shime_story_savefile2.json"
var savefile3_path = "user://savefiles/shime_story_savefile3.json"
var options_path = "user://savefiles/shime_options.json"

var data: Dictionary = {
	"currentworld": "",
	"currentlives": "",
	"trianglestotal": "",
	"savefile1made": false,
	"savefile2made": false,
	"savefile3made": false,
	"worldmap":
	{
		"world1":
			{
				"tutorial":
					{
						"trianglecollected1": false,
						"trianglecollected2": false,
						"trianglecollected3": false,
						"trianglecollected4": false,
						"hasbeencompleted": false
					},
				"level1":
					{
						"level1is_unlocked": false,
						"trianglecollected1": false,
						"trianglecollected2": false,
						"trianglecollected3": false,
						"trianglecollected4": false,
						"hasbeencompleted": false
					},
				"level2":
					{
						"level2is_unlocked": false,
						"trianglecollected1": false,
						"trianglecollected2": false,
						"trianglecollected3": false,
						"trianglecollected4": false,
						"hasbeencompleted": false
					},
				"boss":
					{
						"bossis_unlocked": false,
						"hasbeencompleted": false
					},
			},
	},
}

var new_data = { }

func _ready():
	_load()

func _save():
	var file = FileAccess.open(savefile1_path, FileAccess.WRITE)
	file.store_var(data.duplicate())
	if file == null:
		print("Uh Oh! There was an error upon saving your save data!", FileAccess.get_open_error())
	file.close()

func _load():
	if FileAccess.file_exists(savefile1_path):
		var file = FileAccess.open(savefile1_path, FileAccess.READ)
		var gamedata = file.get_var()
		file.close()
	
		var save_data = gamedata.duplicate()
		data.currentworld = save_data.currentworld
		data.currentlives = save_data.currentlives
		data.trianglestotal = save_data.trianglestotal
		data.savefile1made = save_data.savefile1made
		data.savefile2made = save_data.savefile2made
		data.savefile3made = save_data.savefile3made
		data.worldmap.world1.tutorial.trianglecollected1 = save_data.worldmap.world1.tutorial.trianglecollected1
		data.worldmap.world1.tutorial.trianglecollected2 = save_data.worldmap.world1.tutorial.trianglecollected2
		data.worldmap.world1.tutorial.trianglecollected3 = save_data.worldmap.world1.tutorial.trianglecollected3
		data.worldmap.world1.tutorial.trianglecollected4 = save_data.worldmap.world1.tutorial.trianglecollected4
		data.worldmap.world1.tutorial.hasbeencompleted = save_data.worldmap.world1.tutorial.hasbeencompleted
		data.worldmap.world1.level1.level1is_unlocked = save_data.worldmap.world1.level1.level1is_unlocked
		data.worldmap.world1.level1.trianglecollected1 = save_data.worldmap.world1.level1.trianglecollected1
		data.worldmap.world1.level1.trianglecollected2 = save_data.worldmap.world1.level1.trianglecollected2
		data.worldmap.world1.level1.trianglecollected3 = save_data.worldmap.world1.level1.trianglecollected3
		data.worldmap.world1.level1.trianglecollected4 = save_data.worldmap.world1.level1.trianglecollected4
		data.worldmap.world1.level1.hasbeencompleted = save_data.worldmap.world1.level1.hasbeencompleted
		data.worldmap.world1.level2.level2is_unlocked = save_data.worldmap.world1.level2.level2is_unlocked
		data.worldmap.world1.level2.trianglecollected1 = save_data.worldmap.world1.level2.trianglecollected1
		data.worldmap.world1.level2.trianglecollected2 = save_data.worldmap.world1.level2.trianglecollected2
		data.worldmap.world1.level2.trianglecollected3 = save_data.worldmap.world1.level2.trianglecollected3
		data.worldmap.world1.level2.trianglecollected4 = save_data.worldmap.world1.level2.trianglecollected4
		data.worldmap.world1.level2.hasbeencompleted = save_data.worldmap.world1.level2.hasbeencompleted
		data.worldmap.world1.boss.bossis_unlocked = save_data.worldmap.world1.boss.bossis_unlocked
		data.worldmap.world1.boss.hasbeencompleted = save_data.worldmap.world1.boss.hasbeencompleted
