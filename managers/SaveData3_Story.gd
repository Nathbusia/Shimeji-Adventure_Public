extends Resource
class_name SaveDataThreeResource

#Basic Story Mode Info
@export var currentworld: String = "world1"
@export var currentplayerlives: int = 3
@export var currentplayerlivest: int = 0
@export var maxcurrentlives : int = 3
@export var trianglestotal : int = 0
@export var trianglestotalt : int = 0
@export var trianglestotalh : int = 0
@export var maxtrianglestotal : int = 0

#Story Mode Progress
@export var world1_tutorial_trianglecollect1: bool = false
@export var world1_tutorial_trianglecollect2: bool = false
@export var world1_tutorial_trianglecollect3: bool = false
@export var world1_tutorial_trianglecollect4: bool = false
@export var world1_tutorial_completed: bool = false
@export var world1_level1_unlocked: bool = false
@export var world1_level1_trianglecollect1: bool = false
@export var world1_level1_trianglecollect2: bool = false
@export var world1_level1_trianglecollect3: bool = false
@export var world1_level1_trianglecollect4: bool = false
@export var world1_level1_completed: bool = false
@export var world1_level2_unlocked: bool = false
@export var world1_level2_trianglecollect1: bool = false
@export var world1_level2_trianglecollect2: bool = false
@export var world1_level2_trianglecollect3: bool = false
@export var world1_level2_trianglecollect4: bool = false
@export var world1_level2_completed: bool = false
@export var world1_boss_unlocked: bool = false
@export var world1_boss_completed: bool = false

@export var data_dic = {
	"currentworld": LevelsManager.worldname,
	"currentlives": SaveFileManager3.currentplayerlives,
	"currentlivest": SaveFileManager3.currentplayerlivest,
	"maxlives": SaveFileManager3.maxcurrentlives,
	"trianglestotal": SaveFileManager3.trianglestotal,
	"trianglestotalt": SaveFileManager3.trianglestotalt,
	"trianglestotalh": SaveFileManager3.trianglestotalh,
	"maxtriangles": SaveFileManager3.maxtrianglestotal
	}

@export var world1_tutorial_dic = {
	"trianglecollected1": false,
	"trianglecollected2": false,
	"trianglecollected3": false,
	"trianglecollected4": false,
	"hasbeencompleted": false
}

@export var world1_level1_dic = {
	"unlocked": false,
	"trianglecollected1": false,
	"trianglecollected2": false,
	"trianglecollected3": false,
	"trianglecollected4": false,
	"hasbeencompleted": false
}

@export var world1_level2_dic = {
	"unlocked": false,
	"trianglecollected1": false,
	"trianglecollected2": false,
	"trianglecollected3": false,
	"trianglecollected4": false,
	"hasbeencompleted": false
}

@export var world1_boss_dic = {
	"unlocked": false,
	"hasbeencompleted": false
}
