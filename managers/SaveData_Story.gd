extends Resource
class_name SaveDataResource

#Basic Story Mode Info
@export var currentworld: String = ""
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

#Story Mode Progress (World 2)
@export var world2_level1_trianglecollect1: bool = false
@export var world2_level1_trianglecollect2: bool = false
@export var world2_level1_trianglecollect3: bool = false
@export var world2_level1_trianglecollect4: bool = false
@export var world2_level1_completed: bool = false
@export var world2_level2_unlocked: bool = false
@export var world2_level2_trianglecollect1: bool = false
@export var world2_level2_trianglecollect2: bool = false
@export var world2_level2_trianglecollect3: bool = false
@export var world2_level2_trianglecollect4: bool = false
@export var world2_level2_completed: bool = false
@export var world2_level3_unlocked: bool = false
@export var world2_level3_trianglecollect1: bool = false
@export var world2_level3_trianglecollect2: bool = false
@export var world2_level3_trianglecollect3: bool = false
@export var world2_level3_trianglecollect4: bool = false
@export var world2_level3_completed: bool = false
@export var world2_boss_unlocked: bool = false
@export var world2_boss_completed: bool = false

#World Unlocks
@export var world2_unlocked: bool = false
@export var recentlyunlocked_world2: bool = false
@export var world3_unlocked: bool = false
@export var world4_unlocked: bool = false
@export var world5_unlocked: bool = false
@export var world6_unlocked: bool = false
@export var world7_unlocked: bool = false
@export var world8_unlocked: bool = false

@export var data_dic = {
	"currentworld": LevelsManager.worldname,
	"currentlives": SaveFileManager.currentplayerlives,
	"currentlivest": SaveFileManager.currentplayerlivest,
	"maxlives": SaveFileManager.maxcurrentlives,
	"trianglestotal": SaveFileManager.trianglestotal,
	"trianglestotalt": SaveFileManager.trianglestotalt,
	"trianglestotalh": SaveFileManager.trianglestotalh,
	"maxtriangles": SaveFileManager.maxtrianglestotal
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

@export var world2_level1_dic = {
	"trianglecollected1": false,
	"trianglecollected2": false,
	"trianglecollected3": false,
	"trianglecollected4": false,
	"hasbeencompleted": false
}

@export var world2_level2_dic = {
	"unlocked": false,
	"trianglecollected1": false,
	"trianglecollected2": false,
	"trianglecollected3": false,
	"trianglecollected4": false,
	"hasbeencompleted": false
}

@export var world2_level3_dic = {
	"unlocked": false,
	"trianglecollected1": false,
	"trianglecollected2": false,
	"trianglecollected3": false,
	"trianglecollected4": false,
	"hasbeencompleted": false
}

@export var world2_boss_dic = {
	"unlocked": false,
	"hasbeencompleted": false
}

@export var world_unlocks_dic = {
	"world2unlocked": false,
	"recentlyunlocked_world2": false,
	"world3unlocked": false,
	"world4unlocked": false,
	"world5unlocked": false,
	"world6unlocked": false,
	"world7unlocked": false,
	"world8unlocked": false
}
