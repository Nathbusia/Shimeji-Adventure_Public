class_name LevelSelect extends Node2D

@onready var world_selection_buttons: Panel = $WorldSelect/WorldSelectionButtons
@onready var world_1_button: TextureButton = $WorldSelect/WorldSelectionButtons/HBoxContainer/World1/World1Button
@onready var world_2_button: TextureButton = $WorldSelect/WorldSelectionButtons/HBoxContainer/World2/World2Button
@onready var test_button: TextureButton = $WorldSelect/WorldSelectionButtons/HBoxContainer/TestWorld/TestButton
@onready var custom_button: TextureButton = $WorldSelect/WorldSelectionButtons/HBoxContainer/Custom/CustomButton
@onready var slot_button_lv_1: TextureButton = $LevelSelect/TestWorld/HBoxContainer/levelslot_testlevel1/CharSelect_BG/LevelSelect_Icon/CharSelect_FG/SlotButton_lv1
@onready var slot_button_lv_2: TextureButton = $LevelSelect/TestWorld/HBoxContainer/levelslot_testlevel2/CharSelect_BG/LevelSelect_Icon/CharSelect_FG/SlotButton_lv2
@onready var test_world: Panel = $LevelSelect/TestWorld
@onready var world_1: Panel = $LevelSelect/World1
@onready var world_2: Panel = $LevelSelect/World2
@onready var custom: Panel = $LevelSelect/Custom
@onready var text: AnimatedSprite2D = $Text
@onready var go_button: TextureButton = $GO_Button
@onready var back_button: TextureButton = $BACK_Button
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover
@onready var level_select: Control = $LevelSelect

@onready var level_thumbnail: TextureRect = $LevelSelect/LevelInfo/LevelThumbnail
@onready var level_name: Label = $LevelSelect/LevelInfo/LevelName
@onready var level_creator: Label = $LevelSelect/LevelInfo/LevelCreator
@onready var level_description: Label = $LevelSelect/LevelInfo/DescriptionThing/LevelDescription

#Multiplayer Stuff
@onready var player_amount: Control = $PlayerAmount
@onready var player_amount_one: TextureButton = $PlayerAmount/PlayerPanel/PlayerAmount_One
@onready var player_amount_two: TextureButton = $PlayerAmount/PlayerPanel/PlayerAmount_Two
@onready var player_amount_three: TextureButton = $PlayerAmount/PlayerPanel/PlayerAmount_Three
@onready var player_amount_four: TextureButton = $PlayerAmount/PlayerPanel/PlayerAmount_Four
@onready var go_button_players: TextureButton = $PlayerAmount/PlayerPanel/GO_Button_Players
@onready var back_button_players: TextureButton = $PlayerAmount/PlayerPanel/BACK_Button_Players


var has_hoverplayed = false
var is_inlevelselect
var is_inworldselect
var can_choose = true
var curLevel = ""
var curWorld = ""
var level_path = ""

func _ready():
	DiscordRPC.state = "Selecting a Level"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	load_customlevels()

	if AltBgmManager.enabled:
		$MenuMusic.stream = load("res://bgm/menu/bgm_mainmenu_ytsafe.ogg")
		$MenuMusic.play()
	else:
		pass

	match LanguageManager.language:
		"spanish":
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World1/WorldText.text = "Mundo 1"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World2/WorldText.text = "Mundo 2"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/TestWorld/WorldText.text = "Mundo de prueba"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/Custom/WorldText.text = "Niveles personalizados"
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "¿Cuántos jugadores?"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "Uno"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "Dos"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "Tres"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "Cuatro"
		"french":
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World1/WorldText.text = "Monde 1"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World2/WorldText.text = "Monde 2"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/TestWorld/WorldText.text = "Monde des tests"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/Custom/WorldText.text = "Niveaux personnalisés"
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "Combien de joueurs ?"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "Un"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "Deux"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "Trois"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "Quatre"
		"italian":
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World1/WorldText.text = "Mondo 1"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World2/WorldText.text = "Mondo 2"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/TestWorld/WorldText.text = "Mondo di prova"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/Custom/WorldText.text = "Livelli personalizzati"
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "Quanti giocatori?"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "Uno"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "Due"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "Tre"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "Quattro"
		"german":
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World1/WorldText.text = "Welt 1"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World2/WorldText.text = "Welt 2"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/TestWorld/WorldText.text = "Testwelt"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/Custom/WorldText.text = "Benutzerdefinierte"
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "Wie viele Spieler?"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "Eins"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "Zwei"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "Drei"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "Vier"
		"japanese":
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World1/WorldText.text = "ワールド1"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/World2/WorldText.text = "ワールド2"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/TestWorld/WorldText.text = "テストワールド"
			$WorldSelect/WorldSelectionButtons/HBoxContainer/Custom/WorldText.text = "カスタムレベル"
			$PlayerAmount/PlayerPanel/PlayerAmountText.text = "プレイヤーは何人ですか？"
			$PlayerAmount/PlayerPanel/PlayerAmount_One/AmountText.text = "一"
			$PlayerAmount/PlayerPanel/PlayerAmount_Two/AmountText.text = "二"
			$PlayerAmount/PlayerPanel/PlayerAmount_Three/AmountText.text = "三"
			$PlayerAmount/PlayerPanel/PlayerAmount_Four/AmountText.text = "四"
		_:
			return
			#Just English
	
	text.play("world_" + LanguageManager.language)

func load_customlevels():
		#These are for the Mods (There's a lot of Numbers... Couldn't figure out an eaiser way without hecking up the code...)
	var scene = get_node("LevelSelect/Custom/HBoxContainer")
	var sub_scene01 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level01"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level01"] + ".tscn"]
	var sub_scene02 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level02"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level02"] + ".tscn"]
	var sub_scene03 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level03"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level03"] + ".tscn"]
	var sub_scene04 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level04"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level04"] + ".tscn"]
	var sub_scene05 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level05"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level05"] + ".tscn"]
	var sub_scene06 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level06"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level06"] + ".tscn"]
	var sub_scene07 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level07"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level07"] + ".tscn"]
	var sub_scene08 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level08"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level08"] + ".tscn"]
	var sub_scene09 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level09"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level09"] + ".tscn"]
	var sub_scene10 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level10"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level10"] + ".tscn"]
	var sub_scene11 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level11"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level11"] + ".tscn"]
	var sub_scene12 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level12"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level12"] + ".tscn"]
	var sub_scene13 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level13"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level13"] + ".tscn"]
	var sub_scene14 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level14"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level14"] + ".tscn"]
	var sub_scene15 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level15"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level15"] + ".tscn"]
	var sub_scene16 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level16"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level16"] + ".tscn"]
	var sub_scene17 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level17"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level17"] + ".tscn"]
	var sub_scene18 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level18"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level18"] + ".tscn"]
	var sub_scene19 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level19"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level19"] + ".tscn"]
	var sub_scene20 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level20"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level20"] + ".tscn"]
	var sub_scene21 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level21"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level21"] + ".tscn"]
	var sub_scene22 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level22"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level22"] + ".tscn"]
	var sub_scene23 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level23"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level23"] + ".tscn"]
	var sub_scene24 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level24"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level24"] + ".tscn"]
	var sub_scene25 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level25"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level25"] + ".tscn"]
	var sub_scene26 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level26"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level26"] + ".tscn"]
	var sub_scene27 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level27"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level27"] + ".tscn"]
	var sub_scene28 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level28"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level28"] + ".tscn"]
	var sub_scene29 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level29"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level29"] + ".tscn"]
	var sub_scene30 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level30"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level30"] + ".tscn"]
	var sub_scene31 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level31"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level31"] + ".tscn"]
	var sub_scene32 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level32"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level32"] + ".tscn"]
	var sub_scene33 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level33"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level33"] + ".tscn"]
	var sub_scene34 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level34"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level34"] + ".tscn"]
	var sub_scene35 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level35"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level35"] + ".tscn"]
	var sub_scene36 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level36"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level36"] + ".tscn"]
	var sub_scene37 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level37"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level37"] + ".tscn"]
	var sub_scene38 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level38"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level38"] + ".tscn"]
	var sub_scene39 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level39"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level39"] + ".tscn"]
	var sub_scene40 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level40"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level40"] + ".tscn"]
	var sub_scene41 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level41"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level41"] + ".tscn"]
	var sub_scene42 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level42"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level42"] + ".tscn"]
	var sub_scene43 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level43"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level43"] + ".tscn"]
	var sub_scene44 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level44"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level44"] + ".tscn"]
	var sub_scene45 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level45"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level45"] + ".tscn"]
	var sub_scene46 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level46"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level46"] + ".tscn"]
	var sub_scene47 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level47"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level47"] + ".tscn"]
	var sub_scene48 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level48"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level48"] + ".tscn"]
	var sub_scene49 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level49"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level49"] + ".tscn"]
	var sub_scene50 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level50"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level50"] + ".tscn"]
	var sub_scene51 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level51"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level51"] + ".tscn"]
	var sub_scene52 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level52"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level52"] + ".tscn"]
	var sub_scene53 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level53"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level53"] + ".tscn"]
	var sub_scene54 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level54"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level54"] + ".tscn"]
	var sub_scene55 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level55"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level55"] + ".tscn"]
	var sub_scene56 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level56"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level56"] + ".tscn"]
	var sub_scene57 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level57"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level57"] + ".tscn"]
	var sub_scene58 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level58"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level58"] + ".tscn"]
	var sub_scene59 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level59"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level59"] + ".tscn"]
	var sub_scene60 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level60"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level60"] + ".tscn"]
	var sub_scene61 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level61"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level61"] + ".tscn"]
	var sub_scene62 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level62"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level62"] + ".tscn"]
	var sub_scene63 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level63"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level63"] + ".tscn"]
	var sub_scene64 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level64"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level64"] + ".tscn"]
	var sub_scene65 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level65"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level65"] + ".tscn"]
	var sub_scene66 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level66"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level66"] + ".tscn"]
	var sub_scene67 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level67"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level67"] + ".tscn"]
	var sub_scene68 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level68"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level68"] + ".tscn"]
	var sub_scene69 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level69"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level69"] + ".tscn"]
	var sub_scene70 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level70"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level70"] + ".tscn"]
	var sub_scene71 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level71"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level71"] + ".tscn"]
	var sub_scene72 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level72"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level72"] + ".tscn"]
	var sub_scene73 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level73"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level73"] + ".tscn"]
	var sub_scene74 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level74"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level74"] + ".tscn"]
	var sub_scene75 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level75"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level75"] + ".tscn"]
	var sub_scene76 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level76"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level76"] + ".tscn"]
	var sub_scene77 = ModLevelsManager.mods_load["mods/levels-bosses/" + ModListManager.modlvls["Levels-Bosses"]["level77"] + "/scene/levelselect/levelslot_" + ModListManager.modlvls["Levels-Bosses"]["level77"] + ".tscn"]
	if sub_scene01:
		var customlevel = sub_scene01.instantiate()
		scene.add_child(customlevel)
	if sub_scene02:
		var customlevel = sub_scene02.instantiate()
		scene.add_child(customlevel)
	if sub_scene03:
		var customlevel = sub_scene03.instantiate()
		scene.add_child(customlevel)
	if sub_scene04:
		var customlevel = sub_scene04.instantiate()
		scene.add_child(customlevel)
	if sub_scene05:
		var customlevel = sub_scene05.instantiate()
		scene.add_child(customlevel)
	if sub_scene06:
		var customlevel = sub_scene06.instantiate()
		scene.add_child(customlevel)
	if sub_scene07:
		var customlevel = sub_scene07.instantiate()
		scene.add_child(customlevel)
	if sub_scene08:
		var customlevel = sub_scene08.instantiate()
		scene.add_child(customlevel)
	if sub_scene09:
		var customlevel = sub_scene09.instantiate()
		scene.add_child(customlevel)
	if sub_scene10:
		var customlevel = sub_scene10.instantiate()
		scene.add_child(customlevel)
	if sub_scene11:
		var customlevel = sub_scene11.instantiate()
		scene.add_child(customlevel)
	if sub_scene12:
		var customlevel = sub_scene12.instantiate()
		scene.add_child(customlevel)
	if sub_scene13:
		var customlevel = sub_scene13.instantiate()
		scene.add_child(customlevel)
	if sub_scene14:
		var customlevel = sub_scene14.instantiate()
		scene.add_child(customlevel)
	if sub_scene15:
		var customlevel = sub_scene15.instantiate()
		scene.add_child(customlevel)
	if sub_scene16:
		var customlevel = sub_scene16.instantiate()
		scene.add_child(customlevel)
	if sub_scene17:
		var customlevel = sub_scene17.instantiate()
		scene.add_child(customlevel)
	if sub_scene18:
		var customlevel = sub_scene18.instantiate()
		scene.add_child(customlevel)
	if sub_scene19:
		var customlevel = sub_scene19.instantiate()
		scene.add_child(customlevel)
	if sub_scene20:
		var customlevel = sub_scene20.instantiate()
		scene.add_child(customlevel)
	if sub_scene21:
		var customlevel = sub_scene21.instantiate()
		scene.add_child(customlevel)
	if sub_scene22:
		var customlevel = sub_scene22.instantiate()
		scene.add_child(customlevel)
	if sub_scene23:
		var customlevel = sub_scene23.instantiate()
		scene.add_child(customlevel)
	if sub_scene24:
		var customlevel = sub_scene24.instantiate()
		scene.add_child(customlevel)
	if sub_scene25:
		var customlevel = sub_scene25.instantiate()
		scene.add_child(customlevel)
	if sub_scene26:
		var customlevel = sub_scene26.instantiate()
		scene.add_child(customlevel)
	if sub_scene27:
		var customlevel = sub_scene27.instantiate()
		scene.add_child(customlevel)
	if sub_scene28:
		var customlevel = sub_scene28.instantiate()
		scene.add_child(customlevel)
	if sub_scene29:
		var customlevel = sub_scene29.instantiate()
		scene.add_child(customlevel)
	if sub_scene30:
		var customlevel = sub_scene30.instantiate()
		scene.add_child(customlevel)
	if sub_scene31:
		var customlevel = sub_scene31.instantiate()
		scene.add_child(customlevel)
	if sub_scene32:
		var customlevel = sub_scene32.instantiate()
		scene.add_child(customlevel)
	if sub_scene33:
		var customlevel = sub_scene33.instantiate()
		scene.add_child(customlevel)
	if sub_scene34:
		var customlevel = sub_scene34.instantiate()
		scene.add_child(customlevel)
	if sub_scene35:
		var customlevel = sub_scene35.instantiate()
		scene.add_child(customlevel)
	if sub_scene36:
		var customlevel = sub_scene36.instantiate()
		scene.add_child(customlevel)
	if sub_scene37:
		var customlevel = sub_scene37.instantiate()
		scene.add_child(customlevel)
	if sub_scene38:
		var customlevel = sub_scene38.instantiate()
		scene.add_child(customlevel)
	if sub_scene39:
		var customlevel = sub_scene39.instantiate()
		scene.add_child(customlevel)
	if sub_scene40:
		var customlevel = sub_scene40.instantiate()
		scene.add_child(customlevel)
	if sub_scene41:
		var customlevel = sub_scene41.instantiate()
		scene.add_child(customlevel)
	if sub_scene42:
		var customlevel = sub_scene42.instantiate()
		scene.add_child(customlevel)
	if sub_scene43:
		var customlevel = sub_scene43.instantiate()
		scene.add_child(customlevel)
	if sub_scene44:
		var customlevel = sub_scene44.instantiate()
		scene.add_child(customlevel)
	if sub_scene45:
		var customlevel = sub_scene45.instantiate()
		scene.add_child(customlevel)
	if sub_scene46:
		var customlevel = sub_scene46.instantiate()
		scene.add_child(customlevel)
	if sub_scene47:
		var customlevel = sub_scene47.instantiate()
		scene.add_child(customlevel)
	if sub_scene48:
		var customlevel = sub_scene48.instantiate()
		scene.add_child(customlevel)
	if sub_scene49:
		var customlevel = sub_scene49.instantiate()
		scene.add_child(customlevel)
	if sub_scene50:
		var customlevel = sub_scene50.instantiate()
		scene.add_child(customlevel)
	if sub_scene51:
		var customlevel = sub_scene51.instantiate()
		scene.add_child(customlevel)
	if sub_scene52:
		var customlevel = sub_scene52.instantiate()
		scene.add_child(customlevel)
	if sub_scene53:
		var customlevel = sub_scene53.instantiate()
		scene.add_child(customlevel)
	if sub_scene54:
		var customlevel = sub_scene54.instantiate()
		scene.add_child(customlevel)
	if sub_scene55:
		var customlevel = sub_scene55.instantiate()
		scene.add_child(customlevel)
	if sub_scene56:
		var customlevel = sub_scene56.instantiate()
		scene.add_child(customlevel)
	if sub_scene57:
		var customlevel = sub_scene57.instantiate()
		scene.add_child(customlevel)
	if sub_scene58:
		var customlevel = sub_scene58.instantiate()
		scene.add_child(customlevel)
	if sub_scene59:
		var customlevel = sub_scene59.instantiate()
		scene.add_child(customlevel)
	if sub_scene60:
		var customlevel = sub_scene60.instantiate()
		scene.add_child(customlevel)
	if sub_scene61:
		var customlevel = sub_scene61.instantiate()
		scene.add_child(customlevel)
	if sub_scene62:
		var customlevel = sub_scene62.instantiate()
		scene.add_child(customlevel)
	if sub_scene63:
		var customlevel = sub_scene63.instantiate()
		scene.add_child(customlevel)
	if sub_scene64:
		var customlevel = sub_scene64.instantiate()
		scene.add_child(customlevel)
	if sub_scene65:
		var customlevel = sub_scene65.instantiate()
		scene.add_child(customlevel)
	if sub_scene66:
		var customlevel = sub_scene66.instantiate()
		scene.add_child(customlevel)
	if sub_scene67:
		var customlevel = sub_scene67.instantiate()
		scene.add_child(customlevel)
	if sub_scene68:
		var customlevel = sub_scene68.instantiate()
		scene.add_child(customlevel)
	if sub_scene69:
		var customlevel = sub_scene69.instantiate()
		scene.add_child(customlevel)
	if sub_scene70:
		var customlevel = sub_scene70.instantiate()
		scene.add_child(customlevel)
	if sub_scene71:
		var customlevel = sub_scene71.instantiate()
		scene.add_child(customlevel)
	if sub_scene72:
		var customlevel = sub_scene72.instantiate()
		scene.add_child(customlevel)
	if sub_scene73:
		var customlevel = sub_scene73.instantiate()
		scene.add_child(customlevel)
	if sub_scene74:
		var customlevel = sub_scene74.instantiate()
		scene.add_child(customlevel)
	if sub_scene75:
		var customlevel = sub_scene75.instantiate()
		scene.add_child(customlevel)
	if sub_scene76:
		var customlevel = sub_scene76.instantiate()
		scene.add_child(customlevel)
	if sub_scene77:
		var customlevel = sub_scene77.instantiate()
		scene.add_child(customlevel)

func _process(delta):
	if world_1_button.is_hovered() && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	elif world_2_button.is_hovered() && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	elif test_button.is_hovered() && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	elif custom_button.is_hovered() && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	else:
		has_hoverplayed = false
	
	if is_inlevelselect:
		text.play("level_" + LanguageManager.language)
	else:
		text.play("world_" + LanguageManager.language)


func _on_test_button_pressed() -> void:
	select.play()
	world_selection_buttons.hide()
	test_world.show()
	level_select.show()
	is_inlevelselect = true
	curWorld = "testlevel"
	print("Current World is now " + curWorld + "!")
	
	
func _on_world_1_button_pressed() -> void:
	select.play()
	world_selection_buttons.hide()
	world_1.show()
	level_select.show()
	is_inlevelselect = true
	curWorld = "world1"
	print("Current World is now " + curWorld + "!")


func _on_back_button_pressed() -> void:
	if is_inlevelselect:
		is_inlevelselect = false
		LevelsManager.is_mod = false
		deselect.play()
		world_selection_buttons.show()
		level_select.hide()
		test_world.hide()
		world_1.hide()
		world_2.hide()
		custom.hide()
		go_button.hide()
		level_thumbnail.texture = preload("res://sprites/menu/levelselect/levelselect_thumbnail_nonselect.png")
		level_name.text = "???"
		level_creator.text = "By ???"
		level_description.text = "???"
	else:
		LevelsManager.is_mod = false
		deselect.play()
		LoadManager.load_scene("res://scenes/menu/main_menu.tscn")
		


func _on_slot_button_lv_1_pressed() -> void:
	select.play()
	curLevel = "testlevel1"
	level_path = "res://scenes/levelmanager/testlevel1.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = false
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()
	
func _on_slot_button_lv_2_pressed() -> void:
	select.play()
	curLevel = "testlevel2"
	level_path = "res://scenes/levelmanager/testlevel2.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = false
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()


func _on_go_button_pressed() -> void:
	LevelsManager.levelname = curLevel
	LevelsManager.worldname = curWorld
	player_amount.show()
	select.play()


func _on_slot_button_tutorial_pressed() -> void:
	select.play()
	curLevel = "tutorial"
	level_path = "res://scenes/levelmanager/tutorial.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = false
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()


func _on_slot_button_world_1_level_1_pressed() -> void:
	select.play()
	curLevel = "level1"
	level_path = "res://scenes/levelmanager/level1.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = false
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()


func _on_slot_button_world_1_boss_pressed() -> void:
	select.play()
	curLevel = "boss_monstequare"
	level_path = "res://scenes/levelmanager/boss_mostequare.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = true
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()


func _on_slot_button_world_1_level_2_pressed() -> void:
	select.play()
	curLevel = "level2"
	level_path = "res://scenes/levelmanager/level2.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = false
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()


func _on_custom_button_pressed() -> void:
	select.play()
	world_selection_buttons.hide()
	custom.show()
	level_select.show()
	is_inlevelselect = true
	curWorld = "custom"
	print("Current World is now " + curWorld + "!")


func _on_player_amount_one_pressed() -> void:
	select.play()
	ModeManager.is_multiplayer = false
	ModeManager.multi_2players = false
	ModeManager.multi_3players = false
	ModeManager.multi_4players = false
	player_amount_one.disabled = true
	player_amount_three.disabled = false
	player_amount_two.disabled = false
	player_amount_four.disabled = false
	go_button_players.show()
	print("It's now One Player")
	print("Multiplayer Mode: " + str(ModeManager.is_multiplayer))
	print("2 Players Mode: " + str(ModeManager.multi_2players))
	print("3 Players Mode: " + str(ModeManager.multi_3players))
	print("4 Players Mode: " + str(ModeManager.multi_4players))


func _on_player_amount_two_pressed() -> void:
	select.play()
	ModeManager.is_multiplayer = true
	ModeManager.multi_2players = true
	ModeManager.multi_3players = false
	ModeManager.multi_4players = false
	player_amount_one.disabled = false
	player_amount_three.disabled = false
	player_amount_two.disabled = true
	player_amount_four.disabled = false
	go_button_players.show()
	print("It's now Two Players")
	print("Multiplayer Mode: " + str(ModeManager.is_multiplayer))
	print("2 Players Mode: " + str(ModeManager.multi_2players))
	print("3 Players Mode: " + str(ModeManager.multi_3players))
	print("4 Players Mode: " + str(ModeManager.multi_4players))


func _on_player_amount_three_pressed() -> void:
	select.play()
	ModeManager.is_multiplayer = true
	ModeManager.multi_2players = false
	ModeManager.multi_3players = true
	ModeManager.multi_4players = false
	player_amount_one.disabled = false
	player_amount_three.disabled = true
	player_amount_two.disabled = false
	player_amount_four.disabled = false
	go_button_players.show()
	print("It's now Three Players")
	print("Multiplayer Mode: " + str(ModeManager.is_multiplayer))
	print("2 Players Mode: " + str(ModeManager.multi_2players))
	print("3 Players Mode: " + str(ModeManager.multi_3players))
	print("4 Players Mode: " + str(ModeManager.multi_4players))

func _on_player_amount_four_pressed() -> void:
	select.play()
	ModeManager.is_multiplayer = true
	ModeManager.multi_2players = false
	ModeManager.multi_3players = false
	ModeManager.multi_4players = true
	player_amount_one.disabled = false
	player_amount_three.disabled = false
	player_amount_two.disabled = false
	player_amount_four.disabled = true
	go_button_players.show()
	print("It's now Four Players")
	print("Multiplayer Mode: " + str(ModeManager.is_multiplayer))
	print("2 Players Mode: " + str(ModeManager.multi_2players))
	print("3 Players Mode: " + str(ModeManager.multi_3players))
	print("4 Players Mode: " + str(ModeManager.multi_4players))

func _on_back_button_players_pressed() -> void:
	deselect.play()
	player_amount.hide()


func _on_go_button_players_pressed() -> void:
	select.play()
	LoadManager.load_scene("res://scenes/menu/character_select.tscn")


func _on_world_2_button_pressed() -> void:
	select.play()
	world_selection_buttons.hide()
	world_2.show()
	level_select.show()
	is_inlevelselect = true
	curWorld = "world2"
	print("Current World is now " + curWorld + "!")


func _on_slot_button_w_2_level_1_pressed() -> void:
	select.play()
	curLevel = "world2_level1"
	level_path = "res://scenes/levelmanager/world2_level1.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = false
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()


func _on_slot_button_w_2_level_2_pressed() -> void:
	select.play()
	curLevel = "world2_level2"
	level_path = "res://scenes/levelmanager/world2_level2.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = false
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()


func _on_slot_button_w_2_level_3_pressed() -> void:
	select.play()
	curLevel = "world2_level3"
	level_path = "res://scenes/levelmanager/world2_level3.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = false
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()


func _on_slot_button_world_2_boss_pressed() -> void:
	select.play()
	curLevel = "boss_pete"
	level_path = "res://scenes/levelmanager/boss_pete.tscn"
	var level = load(level_path).instantiate()
	LevelsManager.is_bossbattle = true
	LevelsManager.is_mod = false
	add_child(level)
	level_thumbnail.texture = level.levelthumb
	match LanguageManager.language:
		"spanish":
			level_name.text = level.levelname_spa
			level_description.text = level.leveldesc_spa
		"french":
			level_name.text = level.levelname_fre
			level_description.text = level.leveldesc_fre
		"italian":
			level_name.text = level.levelname_ita
			level_description.text = level.leveldesc_ita
		"german":
			level_name.text = level.levelname_ger
			level_description.text = level.leveldesc_ger
		"japanese":
			level_name.text = level.levelname_jpn
			level_description.text = level.leveldesc_jpn
		_:
			level_name.text = level.levelname
			level_description.text = level.leveldesc
	LevelsManager.leveldisplay = level.levelname
	level_creator.text = level.levelcreator
	print("Current Level is now " + LevelsManager.leveldisplay + "!")
	go_button.show()
