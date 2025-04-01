class_name CharacterSelect extends Node2D

@onready var character_selection_box: GridContainer = $CharactersPanel/HBoxContainer
@onready var windows_bg: TextureRect = $CharacterWindows/WindowsBG
@onready var charactername: Label = $CharacterName/Name
@onready var slot_button_shimeji: TextureButton = $CharactersPanel/HBoxContainer/characterslot_shimeji/CharSelect_BG/CharSelect_Char/CharSelect_FG/SlotButton
@onready var select_sound: AudioStreamPlayer2D = $SelectSound
@onready var shimeji_character_playable: CharacterBody2D = $SceneObjects/ShimejiCharacter_Playable
@onready var go_button: TextureButton = $GO_Button
@onready var back_button: TextureButton = $BACK_Button
@onready var ground_shape: CollisionShape2D = $CharacterWindows/WindowsLayout/GroundandWall/GroundShape
@onready var wall_shape_l: CollisionShape2D = $CharacterWindows/WindowsLayout/GroundandWall/WallShapeL
@onready var wall_shape_r: CollisionShape2D = $CharacterWindows/WindowsLayout/GroundandWall/WallShapeR
@onready var deselect_sound: AudioStreamPlayer2D = $DeselectSound
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect

var curCharacter: String
var player_character_path: String

var characterselected = false

func _ready() -> void:
	DiscordRPC.state = "Selecting a Character"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	load_customcharacters()

func load_customcharacters():
		#These are for the Mods (There's a lot of Numbers... Couldn't figure out an eaiser way without hecking up the code...)
	var scene = get_node("CharactersPanel/HBoxContainer")
	var sub_scene01 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character01"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character01"] + ".tscn"]
	var sub_scene02 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character02"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character02"] + ".tscn"]
	var sub_scene03 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character03"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character03"] + ".tscn"]
	var sub_scene04 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character04"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character04"] + ".tscn"]
	var sub_scene05 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character05"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character05"] + ".tscn"]
	var sub_scene06 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character06"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character06"] + ".tscn"]
	var sub_scene07 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character07"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character07"] + ".tscn"]
	var sub_scene08 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character08"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character08"] + ".tscn"]
	var sub_scene09 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character09"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character09"] + ".tscn"]
	var sub_scene10 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character10"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character10"] + ".tscn"]
	var sub_scene11 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character11"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character11"] + ".tscn"]
	var sub_scene12 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character12"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character12"] + ".tscn"]
	var sub_scene13 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character13"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character13"] + ".tscn"]
	var sub_scene14 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character14"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character14"] + ".tscn"]
	var sub_scene15 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character15"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character15"] + ".tscn"]
	var sub_scene16 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character16"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character16"] + ".tscn"]
	var sub_scene17 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character17"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character17"] + ".tscn"]
	var sub_scene18 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character18"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character18"] + ".tscn"]
	var sub_scene19 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character19"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character19"] + ".tscn"]
	var sub_scene20 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character20"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character20"] + ".tscn"]
	var sub_scene21 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character21"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character21"] + ".tscn"]
	var sub_scene22 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character22"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character22"] + ".tscn"]
	var sub_scene23 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character23"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character23"] + ".tscn"]
	var sub_scene24 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character24"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character24"] + ".tscn"]
	var sub_scene25 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character25"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character25"] + ".tscn"]
	var sub_scene26 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character26"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character26"] + ".tscn"]
	var sub_scene27 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character27"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character27"] + ".tscn"]
	var sub_scene28 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character28"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character28"] + ".tscn"]
	var sub_scene29 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character29"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character29"] + ".tscn"]
	var sub_scene30 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character30"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character30"] + ".tscn"]
	var sub_scene31 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character31"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character31"] + ".tscn"]
	var sub_scene32 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character32"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character32"] + ".tscn"]
	var sub_scene33 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character33"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character33"] + ".tscn"]
	var sub_scene34 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character34"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character34"] + ".tscn"]
	var sub_scene35 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character35"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character35"] + ".tscn"]
	var sub_scene36 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character36"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character36"] + ".tscn"]
	var sub_scene37 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character37"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character37"] + ".tscn"]
	var sub_scene38 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character38"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character38"] + ".tscn"]
	var sub_scene39 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character39"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character39"] + ".tscn"]
	var sub_scene40 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character40"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character40"] + ".tscn"]
	var sub_scene41 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character41"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character41"] + ".tscn"]
	var sub_scene42 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character42"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character42"] + ".tscn"]
	var sub_scene43 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character43"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character43"] + ".tscn"]
	var sub_scene44 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character44"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character44"] + ".tscn"]
	var sub_scene45 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character45"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character45"] + ".tscn"]
	var sub_scene46 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character46"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character46"] + ".tscn"]
	var sub_scene47 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character47"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character47"] + ".tscn"]
	var sub_scene48 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character48"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character48"] + ".tscn"]
	var sub_scene49 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character49"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character49"] + ".tscn"]
	var sub_scene50 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character50"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character50"] + ".tscn"]
	var sub_scene51 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character51"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character51"] + ".tscn"]
	var sub_scene52 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character52"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character52"] + ".tscn"]
	var sub_scene53 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character53"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character53"] + ".tscn"]
	var sub_scene54 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character54"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character54"] + ".tscn"]
	var sub_scene55 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character55"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character55"] + ".tscn"]
	var sub_scene56 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character56"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character56"] + ".tscn"]
	var sub_scene57 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character57"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character57"] + ".tscn"]
	var sub_scene58 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character58"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character58"] + ".tscn"]
	var sub_scene59 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character59"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character59"] + ".tscn"]
	var sub_scene60 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character60"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character60"] + ".tscn"]
	var sub_scene61 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character61"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character61"] + ".tscn"]
	var sub_scene62 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character62"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character62"] + ".tscn"]
	var sub_scene63 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character63"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character63"] + ".tscn"]
	var sub_scene64 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character64"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character64"] + ".tscn"]
	var sub_scene65 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character65"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character65"] + ".tscn"]
	var sub_scene66 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character66"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character66"] + ".tscn"]
	var sub_scene67 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character67"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character67"] + ".tscn"]
	var sub_scene68 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character68"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character68"] + ".tscn"]
	var sub_scene69 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character69"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character69"] + ".tscn"]
	var sub_scene70 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character70"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character70"] + ".tscn"]
	var sub_scene71 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character71"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character71"] + ".tscn"]
	var sub_scene72 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character72"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character72"] + ".tscn"]
	var sub_scene73 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character73"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character73"] + ".tscn"]
	var sub_scene74 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character74"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character74"] + ".tscn"]
	var sub_scene75 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character75"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character75"] + ".tscn"]
	var sub_scene76 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character76"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character76"] + ".tscn"]
	var sub_scene77 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character77"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character77"] + ".tscn"]
	var sub_scene78 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character78"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character78"] + ".tscn"]
	var sub_scene79 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character79"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character79"] + ".tscn"]
	var sub_scene80 = ModCharManager.mods_load["mods/characters/" + ModListManager.modchars["Characters"]["character80"] + "/scene/characterselect/characterslot_" + ModListManager.modchars["Characters"]["character80"] + ".tscn"]
	if sub_scene01:
		var customcharacter = sub_scene01.instantiate()
		scene.add_child(customcharacter)
	if sub_scene02:
		var customcharacter = sub_scene02.instantiate()
		scene.add_child(customcharacter)
	if sub_scene03:
		var customcharacter = sub_scene03.instantiate()
		scene.add_child(customcharacter)
	if sub_scene04:
		var customcharacter = sub_scene04.instantiate()
		scene.add_child(customcharacter)
	if sub_scene05:
		var customcharacter = sub_scene05.instantiate()
		scene.add_child(customcharacter)
	if sub_scene06:
		var customcharacter = sub_scene06.instantiate()
		scene.add_child(customcharacter)
	if sub_scene07:
		var customcharacter = sub_scene07.instantiate()
		scene.add_child(customcharacter)
	if sub_scene08:
		var customcharacter = sub_scene08.instantiate()
		scene.add_child(customcharacter)
	if sub_scene09:
		var customcharacter = sub_scene09.instantiate()
		scene.add_child(customcharacter)
	if sub_scene10:
		var customcharacter = sub_scene10.instantiate()
		scene.add_child(customcharacter)
	if sub_scene11:
		var customcharacter = sub_scene11.instantiate()
		scene.add_child(customcharacter)
	if sub_scene12:
		var customcharacter = sub_scene12.instantiate()
		scene.add_child(customcharacter)
	if sub_scene13:
		var customcharacter = sub_scene13.instantiate()
		scene.add_child(customcharacter)
	if sub_scene14:
		var customcharacter = sub_scene14.instantiate()
		scene.add_child(customcharacter)
	if sub_scene15:
		var customcharacter = sub_scene15.instantiate()
		scene.add_child(customcharacter)
	if sub_scene16:
		var customcharacter = sub_scene16.instantiate()
		scene.add_child(customcharacter)
	if sub_scene17:
		var customcharacter = sub_scene17.instantiate()
		scene.add_child(customcharacter)
	if sub_scene18:
		var customcharacter = sub_scene18.instantiate()
		scene.add_child(customcharacter)
	if sub_scene19:
		var customcharacter = sub_scene19.instantiate()
		scene.add_child(customcharacter)
	if sub_scene20:
		var customcharacter = sub_scene20.instantiate()
		scene.add_child(customcharacter)
	if sub_scene21:
		var customcharacter = sub_scene21.instantiate()
		scene.add_child(customcharacter)
	if sub_scene22:
		var customcharacter = sub_scene22.instantiate()
		scene.add_child(customcharacter)
	if sub_scene23:
		var customcharacter = sub_scene23.instantiate()
		scene.add_child(customcharacter)
	if sub_scene24:
		var customcharacter = sub_scene24.instantiate()
		scene.add_child(customcharacter)
	if sub_scene25:
		var customcharacter = sub_scene25.instantiate()
		scene.add_child(customcharacter)
	if sub_scene26:
		var customcharacter = sub_scene26.instantiate()
		scene.add_child(customcharacter)
	if sub_scene27:
		var customcharacter = sub_scene27.instantiate()
		scene.add_child(customcharacter)
	if sub_scene28:
		var customcharacter = sub_scene28.instantiate()
		scene.add_child(customcharacter)
	if sub_scene29:
		var customcharacter = sub_scene29.instantiate()
		scene.add_child(customcharacter)
	if sub_scene30:
		var customcharacter = sub_scene30.instantiate()
		scene.add_child(customcharacter)
	if sub_scene31:
		var customcharacter = sub_scene31.instantiate()
		scene.add_child(customcharacter)
	if sub_scene32:
		var customcharacter = sub_scene32.instantiate()
		scene.add_child(customcharacter)
	if sub_scene33:
		var customcharacter = sub_scene33.instantiate()
		scene.add_child(customcharacter)
	if sub_scene34:
		var customcharacter = sub_scene34.instantiate()
		scene.add_child(customcharacter)
	if sub_scene35:
		var customcharacter = sub_scene35.instantiate()
		scene.add_child(customcharacter)
	if sub_scene36:
		var customcharacter = sub_scene36.instantiate()
		scene.add_child(customcharacter)
	if sub_scene37:
		var customcharacter = sub_scene37.instantiate()
		scene.add_child(customcharacter)
	if sub_scene38:
		var customcharacter = sub_scene38.instantiate()
		scene.add_child(customcharacter)
	if sub_scene39:
		var customcharacter = sub_scene39.instantiate()
		scene.add_child(customcharacter)
	if sub_scene40:
		var customcharacter = sub_scene40.instantiate()
		scene.add_child(customcharacter)
	if sub_scene41:
		var customcharacter = sub_scene41.instantiate()
		scene.add_child(customcharacter)
	if sub_scene42:
		var customcharacter = sub_scene42.instantiate()
		scene.add_child(customcharacter)
	if sub_scene43:
		var customcharacter = sub_scene43.instantiate()
		scene.add_child(customcharacter)
	if sub_scene44:
		var customcharacter = sub_scene44.instantiate()
		scene.add_child(customcharacter)
	if sub_scene45:
		var customcharacter = sub_scene45.instantiate()
		scene.add_child(customcharacter)
	if sub_scene46:
		var customcharacter = sub_scene46.instantiate()
		scene.add_child(customcharacter)
	if sub_scene47:
		var customcharacter = sub_scene47.instantiate()
		scene.add_child(customcharacter)
	if sub_scene48:
		var customcharacter = sub_scene48.instantiate()
		scene.add_child(customcharacter)
	if sub_scene49:
		var customcharacter = sub_scene49.instantiate()
		scene.add_child(customcharacter)
	if sub_scene50:
		var customcharacter = sub_scene50.instantiate()
		scene.add_child(customcharacter)
	if sub_scene51:
		var customcharacter = sub_scene51.instantiate()
		scene.add_child(customcharacter)
	if sub_scene52:
		var customcharacter = sub_scene52.instantiate()
		scene.add_child(customcharacter)
	if sub_scene53:
		var customcharacter = sub_scene53.instantiate()
		scene.add_child(customcharacter)
	if sub_scene54:
		var customcharacter = sub_scene54.instantiate()
		scene.add_child(customcharacter)
	if sub_scene55:
		var customcharacter = sub_scene55.instantiate()
		scene.add_child(customcharacter)
	if sub_scene56:
		var customcharacter = sub_scene56.instantiate()
		scene.add_child(customcharacter)
	if sub_scene57:
		var customcharacter = sub_scene57.instantiate()
		scene.add_child(customcharacter)
	if sub_scene58:
		var customcharacter = sub_scene58.instantiate()
		scene.add_child(customcharacter)
	if sub_scene59:
		var customcharacter = sub_scene59.instantiate()
		scene.add_child(customcharacter)
	if sub_scene60:
		var customcharacter = sub_scene60.instantiate()
		scene.add_child(customcharacter)
	if sub_scene61:
		var customcharacter = sub_scene61.instantiate()
		scene.add_child(customcharacter)
	if sub_scene62:
		var customcharacter = sub_scene62.instantiate()
		scene.add_child(customcharacter)
	if sub_scene63:
		var customcharacter = sub_scene63.instantiate()
		scene.add_child(customcharacter)
	if sub_scene64:
		var customcharacter = sub_scene64.instantiate()
		scene.add_child(customcharacter)
	if sub_scene65:
		var customcharacter = sub_scene65.instantiate()
		scene.add_child(customcharacter)
	if sub_scene66:
		var customcharacter = sub_scene66.instantiate()
		scene.add_child(customcharacter)
	if sub_scene67:
		var customcharacter = sub_scene67.instantiate()
		scene.add_child(customcharacter)
	if sub_scene68:
		var customcharacter = sub_scene68.instantiate()
		scene.add_child(customcharacter)
	if sub_scene69:
		var customcharacter = sub_scene69.instantiate()
		scene.add_child(customcharacter)
	if sub_scene70:
		var customcharacter = sub_scene70.instantiate()
		scene.add_child(customcharacter)
	if sub_scene71:
		var customcharacter = sub_scene71.instantiate()
		scene.add_child(customcharacter)
	if sub_scene72:
		var customcharacter = sub_scene72.instantiate()
		scene.add_child(customcharacter)
	if sub_scene73:
		var customcharacter = sub_scene73.instantiate()
		scene.add_child(customcharacter)
	if sub_scene74:
		var customcharacter = sub_scene74.instantiate()
		scene.add_child(customcharacter)
	if sub_scene75:
		var customcharacter = sub_scene75.instantiate()
		scene.add_child(customcharacter)
	if sub_scene76:
		var customcharacter = sub_scene76.instantiate()
		scene.add_child(customcharacter)
	if sub_scene77:
		var customcharacter = sub_scene77.instantiate()
		scene.add_child(customcharacter)
	if sub_scene78:
		var customcharacter = sub_scene78.instantiate()
		scene.add_child(customcharacter)
	if sub_scene79:
		var customcharacter = sub_scene79.instantiate()
		scene.add_child(customcharacter)
	if sub_scene80:
		var customcharacter = sub_scene80.instantiate()
		scene.add_child(customcharacter)

func _on_texture_button_pressed() -> void:
	select.play()
	CharactersManager.charactername = curCharacter
	ModeManager.in_gameplay = true
	if ModeManager.is_story:
		LoadManager.load_scene("res://scenes/worldmap/worldmap_world1.tscn")
		if ModeManager.is_savefile1:
			if FileAccess.file_exists("user://savefiles/shime_story_savefile1.tres"):
				ResourceLoader.load("user://savefiles/shime_story_savefile1.tres").duplicate(true)
		if ModeManager.is_savefile2:
			if FileAccess.file_exists("user://savefiles/shime_story_savefile2.tres"):
				ResourceLoader.load("user://savefiles/shime_story_savefile2.tres").duplicate(true)
		if ModeManager.is_savefile3:
			if FileAccess.file_exists("user://savefiles/shime_story_savefile3.tres"):
				ResourceLoader.load("user://savefiles/shime_story_savefile3.tres").duplicate(true)
	else:
		if LevelsManager.is_mod:
			LoadManager.load_scene("res://mods/levels-bosses/" + LevelsManager.levelname + "/scene/" + LevelsManager.levelname + ".tscn")
		else:
			LoadManager.load_scene("res://scenes/levels/" + LevelsManager.worldname + "/" + LevelsManager.levelname + ".tscn")

func characterchoose():
	if characterselected == false:
		shimeji_character_playable.queue_free()
		return

func _on_back_button_pressed() -> void:
	if characterselected:
		characterselected = false
		CharactersManager.is_mod = false
		deselect_sound.play()
		ground_shape.disabled = true
		wall_shape_l.disabled = true
		wall_shape_r.disabled = true
		go_button.hide()
		charactername.text = "???"
		windows_bg.modulate = "#ffffff"
	else:
		if ModeManager.is_story:
			deselect.play()
			LoadManager.load_scene("res://scenes/menu/story_save_file_select.tscn")
		else:
			deselect.play()
			LoadManager.load_scene("res://scenes/menu/level_select.tscn")

func _on_slot_button_pressed() -> void:
	if characterselected:
		return
	else:
		characterselected = true
		ground_shape.disabled = false
		wall_shape_l.disabled = false
		wall_shape_r.disabled = false
		CharactersManager.is_mod = false
		curCharacter = "shimeji_"
		player_character_path = "res://scenes/characters/playable/" + curCharacter + "/shimeji_character_playable.tscn"
		var ShimejiCharacter_Playable = load(player_character_path).instantiate()
		ShimejiCharacter_Playable.position.x = 944
		ShimejiCharacter_Playable.position.y = 307
		add_child(ShimejiCharacter_Playable)
		select_sound.play()
		CharactersManager.characterdisplay = ShimejiCharacter_Playable.charname
		charactername.text = ShimejiCharacter_Playable.charname
		windows_bg.modulate = Color(ShimejiCharacter_Playable.charcolour)
		go_button.show()
		back_button.show()
		print("Current Character is now " + CharactersManager.characterdisplay + "!")

func _on_slot_button_kuro_pressed() -> void:
	if characterselected:
		return
	else:
		characterselected = true
		ground_shape.disabled = false
		wall_shape_l.disabled = false
		wall_shape_r.disabled = false
		CharactersManager.is_mod = false
		curCharacter = "kuroshimeji"
		player_character_path = "res://scenes/characters/playable/" + curCharacter + "/shimeji_character_playable.tscn"
		var ShimejiCharacter_Playable = load(player_character_path).instantiate()
		ShimejiCharacter_Playable.position.x = 944
		ShimejiCharacter_Playable.position.y = 307
		add_child(ShimejiCharacter_Playable)
		select_sound.play()
		CharactersManager.characterdisplay = ShimejiCharacter_Playable.charname
		charactername.text = ShimejiCharacter_Playable.charname
		windows_bg.modulate = Color(ShimejiCharacter_Playable.charcolour)
		go_button.show()
		back_button.show()
		print("Current Character is now " + CharactersManager.characterdisplay + "!")

func _on_slot_button_shiminter_pressed() -> void:
	if characterselected:
		return
	else:
		characterselected = true
		ground_shape.disabled = false
		wall_shape_l.disabled = false
		wall_shape_r.disabled = false
		CharactersManager.is_mod = false
		curCharacter = "shiminter"
		player_character_path = "res://scenes/characters/playable/" + curCharacter + "/shimeji_character_playable.tscn"
		var ShimejiCharacter_Playable = load(player_character_path).instantiate()
		ShimejiCharacter_Playable.position.x = 944
		ShimejiCharacter_Playable.position.y = 307
		add_child(ShimejiCharacter_Playable)
		select_sound.play()
		CharactersManager.characterdisplay = ShimejiCharacter_Playable.charname
		charactername.text = ShimejiCharacter_Playable.charname
		windows_bg.modulate = Color(ShimejiCharacter_Playable.charcolour)
		go_button.show()
		back_button.show()
		print("Current Character is now " + CharactersManager.characterdisplay + "!")

func _on_slot_button_summeji_pressed() -> void:
	if characterselected:
		return
	else:
		characterselected = true
		ground_shape.disabled = false
		wall_shape_l.disabled = false
		wall_shape_r.disabled = false
		CharactersManager.is_mod = false
		curCharacter = "summeji"
		player_character_path = "res://scenes/characters/playable/" + curCharacter + "/shimeji_character_playable.tscn"
		var ShimejiCharacter_Playable = load(player_character_path).instantiate()
		ShimejiCharacter_Playable.position.x = 944
		ShimejiCharacter_Playable.position.y = 307
		add_child(ShimejiCharacter_Playable)
		select_sound.play()
		CharactersManager.characterdisplay = ShimejiCharacter_Playable.charname
		charactername.text = ShimejiCharacter_Playable.charname
		windows_bg.modulate = Color(ShimejiCharacter_Playable.charcolour)
		go_button.show()
		back_button.show()
		print("Current Character is now " + CharactersManager.characterdisplay + "!")

#func _on_slot_button_bluetestball_pressed() -> void:
	#if characterselected:
		#return
	#else:
		#characterselected = true
		#ground_shape.disabled = false
		#wall_shape_l.disabled = false
		#wall_shape_r.disabled = false
		#CharactersManager.is_mod = true
		#curCharacter = "bluetestball"
		#player_character_path = "res://mods/characters/" + curCharacter + "/scenes/shimeji_character_playable.tscn"
		#var ShimejiCharacter_Playable = load(player_character_path).instantiate()
		#ShimejiCharacter_Playable.position.x = 944
		#ShimejiCharacter_Playable.position.y = 307
		#add_child(ShimejiCharacter_Playable)
		#select_sound.play()
		#charactername.text = ShimejiCharacter_Playable.charname
		#windows_bg.modulate = Color(ShimejiCharacter_Playable.charcolour)
		#go_button.show()
		#back_button.show()
		#print("Current Character is now " + curCharacter + "!")
