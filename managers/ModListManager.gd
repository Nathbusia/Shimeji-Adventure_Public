extends Control


var modchars = {
	"Characters": {
		"character01": "empty",
		"character02": "empty",
		"character03": "empty",
		"character04": "empty",
		"character05": "empty",
		"character06": "empty",
		"character07": "empty",
		"character08": "empty",
		"character09": "empty",
		"character10": "empty",
		"character11": "empty",
		"character12": "empty",
		"character13": "empty",
		"character14": "empty",
		"character15": "empty",
		"character16": "empty",
		"character17": "empty",
		"character18": "empty",
		"character19": "empty",
		"character20": "empty",
		"character21": "empty",
		"character22": "empty",
		"character23": "empty",
		"character24": "empty",
		"character25": "empty",
		"character26": "empty",
		"character27": "empty",
		"character28": "empty",
		"character29": "empty",
		"character30": "empty",
		"character31": "empty",
		"character32": "empty",
		"character33": "empty",
		"character34": "empty",
		"character35": "empty",
		"character36": "empty",
		"character37": "empty",
		"character38": "empty",
		"character39": "empty",
		"character40": "empty",
		"character41": "empty",
		"character42": "empty",
		"character43": "empty",
		"character44": "empty",
		"character45": "empty",
		"character46": "empty",
		"character47": "empty",
		"character48": "empty",
		"character49": "empty",
		"character50": "empty",
		"character51": "empty",
		"character52": "empty",
		"character53": "empty",
		"character54": "empty",
		"character55": "empty",
		"character56": "empty",
		"character57": "empty",
		"character58": "empty",
		"character59": "empty",
		"character60": "empty",
		"character61": "empty",
		"character62": "empty",
		"character63": "empty",
		"character64": "empty",
		"character65": "empty",
		"character66": "empty",
		"character67": "empty",
		"character68": "empty",
		"character69": "empty",
		"character70": "empty",
		"character71": "empty",
		"character72": "empty",
		"character73": "empty",
		"character74": "empty",
		"character75": "empty",
		"character76": "empty",
		"character77": "empty",
		"character78": "empty",
		"character79": "empty",
		"character80": "empty",
	}
}
var modlvls = {
	"Levels-Bosses": {
		"level01": "empty",
		"level02": "empty",
		"level03": "empty",
		"level04": "empty",
		"level05": "empty",
		"level06": "empty",
		"level07": "empty",
		"level08": "empty",
		"level09": "empty",
		"level10": "empty",
		"level11": "empty",
		"level12": "empty",
		"level13": "empty",
		"level14": "empty",
		"level15": "empty",
		"level16": "empty",
		"level17": "empty",
		"level18": "empty",
		"level19": "empty",
		"level20": "empty",
		"level21": "empty",
		"level22": "empty",
		"level23": "empty",
		"level24": "empty",
		"level25": "empty",
		"level26": "empty",
		"level27": "empty",
		"level28": "empty",
		"level29": "empty",
		"level30": "empty",
		"level31": "empty",
		"level32": "empty",
		"level33": "empty",
		"level34": "empty",
		"level35": "empty",
		"level36": "empty",
		"level37": "empty",
		"level38": "empty",
		"level39": "empty",
		"level40": "empty",
		"level41": "empty",
		"level42": "empty",
		"level43": "empty",
		"level44": "empty",
		"level45": "empty",
		"level46": "empty",
		"level47": "empty",
		"level48": "empty",
		"level49": "empty",
		"level50": "empty",
		"level51": "empty",
		"level52": "empty",
		"level53": "empty",
		"level54": "empty",
		"level55": "empty",
		"level56": "empty",
		"level57": "empty",
		"level58": "empty",
		"level59": "empty",
		"level60": "empty",
		"level61": "empty",
		"level62": "empty",
		"level63": "empty",
		"level64": "empty",
		"level65": "empty",
		"level66": "empty",
		"level67": "empty",
		"level68": "empty",
		"level69": "empty",
		"level70": "empty",
		"level71": "empty",
		"level72": "empty",
		"level73": "empty",
		"level74": "empty",
		"level75": "empty",
		"level76": "empty",
		"level77": "empty",
	}
}



var root := ProjectSettings.globalize_path("res://")
var mods_location := "mods"

func _ready() -> void:
	if FileAccess.file_exists("user://ModCharactersList.ini"):
		load_modcharlist()
	else:
		save_modcharlist()

	if FileAccess.file_exists("user://ModLevelsList.ini"):
		load_modlvllist()
	else:
		save_modlvllist()
	#OS.shell_open(OS.get_user_data_dir())

func save_modcharlist() -> void:
	var c: ConfigFile = ConfigFile.new()
	for section: String in modchars.keys():
		for key: String in modchars[section]:
			c.set_value(section, key, modchars[section][key])
	c.save("user://ModCharactersList.ini")

func save_modlvllist() -> void:
	var c: ConfigFile = ConfigFile.new()
	for section: String in modlvls.keys():
		for key: String in modlvls[section]:
			c.set_value(section, key, modlvls[section][key])
	c.save("user://ModLevelsList.ini")

func load_modcharlist():
	var c: ConfigFile = ConfigFile.new()
	var err: Error = c.load("user://ModCharactersList.ini")
	if err != OK:
		print("Yikes! There an Error among us!")
	for section: String in modchars.keys():
		for key: String in modchars[section]:
			modchars[section][key] = c.get_value(section, key)
	
func load_modlvllist():
	var c: ConfigFile = ConfigFile.new()
	var err: Error = c.load("user://ModLevelsList.ini")
	if err != OK:
		print("Yikes! There an Error among us!")
	for section: String in modlvls.keys():
		for key: String in modlvls[section]:
			modlvls[section][key] = c.get_value(section, key)
