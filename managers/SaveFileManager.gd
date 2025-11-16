extends Node

@export var currentworld = ""
@export var currentplayerlives = 3
@export var currentplayerlivest = 0
@export var maxcurrentlives = 3
@export var trianglestotal = 0
@export var trianglestotalt = 0
@export var trianglestotalh = 0
@export var maxtrianglestotal = 0

#For File Select menu
@export var is_savefile1newsave = true
@export var is_savefile2newsave = true
@export var is_savefile3newsave = true

@export var data_dic = {
	"currentworld": LevelsManager.worldname,
	"currentlives": currentplayerlives,
	"currentlivest": currentplayerlivest,
	"maxlives": maxcurrentlives,
	"trianglestotal": trianglestotal,
	"trianglestotalt": trianglestotalt, 
	"trianglestotalh": trianglestotalh, 
	"maxtriangles": maxtrianglestotal
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
	"world8unlocked": false,
}

func new_triangle():
	trianglestotal += 1
	maxtrianglestotal += 1
	print(maxtrianglestotal)
	if trianglestotal == 10 or trianglestotal == 20 or trianglestotal == 30 or trianglestotal == 40 or trianglestotal == 50 or trianglestotal == 60 or trianglestotal == 70 or trianglestotal == 80 or trianglestotal == 90:
		trianglestotalt += 1
		trianglestotal = 0
	if trianglestotalt == 10 or trianglestotalt == 20 or trianglestotalt == 30 or trianglestotalt == 40 or trianglestotalt == 50 or trianglestotalt == 60 or trianglestotalt == 70 or trianglestotalt == 80 or trianglestotalt == 90:
		trianglestotalh += 1
		trianglestotalt = 0
		trianglestotal = 0

func new_life():
	currentplayerlives += 1
	maxcurrentlives += 1
	if currentplayerlives == 10 or currentplayerlives == 20 or currentplayerlives == 30 or currentplayerlives == 40 or currentplayerlives == 50 or currentplayerlives == 60 or currentplayerlives == 70 or currentplayerlives == 80 or currentplayerlives == 90:
		currentplayerlivest += 1
		currentplayerlives = 0

func lose_life():
	currentplayerlives -= 1
	maxcurrentlives -= 1

func update_data(currentworld, currentlives, currentlivest, maxlives, triangles,
 trianglest, trianglesh, maxtriangles):
	data_dic["currentworld"] = currentworld
	data_dic["currentlives"] = currentlives
	data_dic["currentlivest"] = currentlivest
	data_dic["maxlives"] = maxlives
	data_dic["trianglestotal"] = triangles
	data_dic["trianglestotalt"] = trianglest
	data_dic["trianglestotalh"] = trianglesh
	data_dic["maxtriangles"] = maxtriangles

func update_w1_tut(trianglecollected1, trianglecollected2, trianglecollected3, 
trianglecollected4, hasbeencompleted):
	world1_tutorial_dic["trianglecollected1"] = trianglecollected1
	world1_tutorial_dic["trianglecollected2"] = trianglecollected2
	world1_tutorial_dic["trianglecollected3"] = trianglecollected3
	world1_tutorial_dic["trianglecollected4"] = trianglecollected4
	world1_tutorial_dic["hasbeencompleted"] = hasbeencompleted

func update_w1_lv1(unlocked, trianglecollected1, trianglecollected2, trianglecollected3, 
trianglecollected4, hasbeencompleted):
	world1_level1_dic["unlocked"] = unlocked
	world1_level1_dic["trianglecollected1"] = trianglecollected1
	world1_level1_dic["trianglecollected2"] = trianglecollected2
	world1_level1_dic["trianglecollected3"] = trianglecollected3
	world1_level1_dic["trianglecollected4"] = trianglecollected4
	world1_level1_dic["hasbeencompleted"] = hasbeencompleted

func update_w1_lv2(unlocked, trianglecollected1, trianglecollected2, trianglecollected3, 
trianglecollected4, hasbeencompleted):
	world1_level2_dic["unlocked"] = unlocked
	world1_level2_dic["trianglecollected1"] = trianglecollected1
	world1_level2_dic["trianglecollected2"] = trianglecollected2
	world1_level2_dic["trianglecollected3"] = trianglecollected3
	world1_level2_dic["trianglecollected4"] = trianglecollected4
	world1_level2_dic["hasbeencompleted"] = hasbeencompleted

func update_w1_boss(unlocked, hasbeencompleted):
	world1_boss_dic["unlocked"] = unlocked
	world1_boss_dic["hasbeencompleted"] = hasbeencompleted

func update_w2_lv1(trianglecollected1, trianglecollected2, trianglecollected3, 
trianglecollected4, hasbeencompleted):
	world2_level1_dic["trianglecollected1"] = trianglecollected1
	world2_level1_dic["trianglecollected2"] = trianglecollected2
	world2_level1_dic["trianglecollected3"] = trianglecollected3
	world2_level1_dic["trianglecollected4"] = trianglecollected4
	world2_level1_dic["hasbeencompleted"] = hasbeencompleted

func update_w2_lv2(unlocked, trianglecollected1, trianglecollected2, trianglecollected3, 
trianglecollected4, hasbeencompleted):
	world2_level2_dic["unlocked"] = unlocked
	world2_level2_dic["trianglecollected1"] = trianglecollected1
	world2_level2_dic["trianglecollected2"] = trianglecollected2
	world2_level2_dic["trianglecollected3"] = trianglecollected3
	world2_level2_dic["trianglecollected4"] = trianglecollected4
	world2_level2_dic["hasbeencompleted"] = hasbeencompleted

func update_w2_lv3(unlocked, trianglecollected1, trianglecollected2, trianglecollected3, 
trianglecollected4, hasbeencompleted):
	world2_level3_dic["unlocked"] = unlocked
	world2_level3_dic["trianglecollected1"] = trianglecollected1
	world2_level3_dic["trianglecollected2"] = trianglecollected2
	world2_level3_dic["trianglecollected3"] = trianglecollected3
	world2_level3_dic["trianglecollected4"] = trianglecollected4
	world2_level3_dic["hasbeencompleted"] = hasbeencompleted

func update_w2_boss(unlocked, hasbeencompleted):
	world2_boss_dic["unlocked"] = unlocked
	world2_boss_dic["hasbeencompleted"] = hasbeencompleted

func update_world_unlocks_dic(world2unlocked, recentlyunlocked_world2, world3unlocked,
world4unlocked, world5unlocked, world6unlocked, world7unlocked, world8unlocked):
	world_unlocks_dic["world2unlocked"] = world2unlocked
	world_unlocks_dic["recentlyunlocked_world2"] = recentlyunlocked_world2
	world_unlocks_dic["world3unlocked"] = world3unlocked
	world_unlocks_dic["world4unlocked"] = world4unlocked
	world_unlocks_dic["world5unlocked"] = world5unlocked
	world_unlocks_dic["world6unlocked"] = world6unlocked
	world_unlocks_dic["world7unlocked"] = world7unlocked
	world_unlocks_dic["world8unlocked"] = world8unlocked
