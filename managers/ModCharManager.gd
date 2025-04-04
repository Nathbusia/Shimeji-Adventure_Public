extends Node

var mods_location := "mods/characters"
var mods_load : Dictionary

func _init() -> void:
	var root := ProjectSettings.globalize_path("res://")
	var modschar_files = get_files(root, mods_location)

	for file_path in modschar_files:
		ProjectSettings.load_resource_pack(file_path)

	var mods_files_from_inside = get_files("res://", mods_location)
	
	for file_path in mods_files_from_inside:
		var new_path: String = file_path.replace(".remap", "").replace(".import", "")
		mods_load[new_path] = load(new_path)
		print(new_path)

func get_files(root: String, location: String) -> Array[String]:
	var dir: DirAccess = DirAccess.open(root + location)
	var files: Array[String] = []
	
	if dir:
		dir.list_dir_begin()
		var file := dir.get_next()
		while file != "":
			var file_location := location + "/" + file
			if dir.current_is_dir():
				files += get_files(root, file_location)
			else:
				files.append(file_location)
			file = dir.get_next()
		dir.list_dir_end()
		return files
	return []
