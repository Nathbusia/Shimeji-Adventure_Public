extends AnimatableBody2D

@onready var game_manager: GameManager = $"../../../GameManager"
var randomchance = RandomNumberGenerator

#Sprites
@onready var pete_body: Sprite2D = $PeteBody
@onready var eyes: AnimatedSprite2D = $PeteBody/Eyes
@onready var moustache: AnimatedSprite2D = $PeteBody/Moustache
@onready var mouth: AnimatedSprite2D = $PeteBody/Mouth

#Animations
@onready var pete_anim: AnimationPlayer = $PeteAnim
@onready var pete_windows_anim: AnimationPlayer = $PeteWindowsAnim

#Voice Clips
@onready var attack_boxing_glove: AudioStreamPlayer2D = $VoiceClips/Attack_BoxingGlove
@onready var attack_beam_cannon: AudioStreamPlayer2D = $VoiceClips/Attack_BeamCannon
@onready var summon: AudioStreamPlayer2D = $VoiceClips/Summon
@onready var teleport_in: AudioStreamPlayer2D = $VoiceClips/Teleport_In
@onready var teleport_out: AudioStreamPlayer2D = $VoiceClips/Teleport_Out
@onready var damage: AudioStreamPlayer2D = $VoiceClips/Damage
@onready var defeat: AudioStreamPlayer2D = $VoiceClips/Defeat

#SFX
@onready var teleport_in_sfx: AudioStreamPlayer2D = $SFX/TeleportInSFX
@onready var teleport_out_sfx: AudioStreamPlayer2D = $SFX/TeleportOutSFX
@onready var damage_sfx: AudioStreamPlayer2D = $SFX/DamageSFX
@onready var defeat_sfx: AudioStreamPlayer2D = $SFX/DefeatSFX
@onready var summon_sfx: AudioStreamPlayer2D = $SFX/SummonSFX
@onready var windows_pop_up_sfx: AudioStreamPlayer2D = $SFX/WindowsPopUpSFX

#Markers (Attack)
@onready var punch_glove_windows_spawn_a: Marker2D = $Markers_Attack/PunchGloveWindowsSpawnA
@onready var punch_glove_windows_spawn_b: Marker2D = $Markers_Attack/PunchGloveWindowsSpawnB
@onready var beam_cannon_windows_spawn_a: Marker2D = $Markers_Attack/BeamCannonWindowsSpawnA
@onready var beam_cannon_windows_spawn_b: Marker2D = $Markers_Attack/BeamCannonWindowsSpawnB

#Markers (Teleportation)
@onready var teleport_spawn: Marker2D = $Markers_Teleportation/TeleportSpawn
@onready var teleport_spawn_2: Marker2D = $Markers_Teleportation/TeleportSpawn2
@onready var teleport_spawn_3: Marker2D = $Markers_Teleportation/TeleportSpawn3
@onready var teleport_spawn_4: Marker2D = $Markers_Teleportation/TeleportSpawn4

#Markers (Sticknodes)
@onready var sticknode_spawn: Marker2D = $Markers_Sticknodes/SticknodeSpawn
@onready var sticknode_spawn_2: Marker2D = $Markers_Sticknodes/SticknodeSpawn2
@onready var sticknode_spawn_3: Marker2D = $Markers_Sticknodes/SticknodeSpawn3
@onready var sticknode_spawn_4: Marker2D = $Markers_Sticknodes/SticknodeSpawn4
@onready var sticknode_spawn_5: Marker2D = $Markers_Sticknodes/SticknodeSpawn5
@onready var sticknode_spawn_6: Marker2D = $Markers_Sticknodes/SticknodeSpawn6
@onready var sticknode_spawn_7: Marker2D = $Markers_Sticknodes/SticknodeSpawn7
@onready var sticknode_spawn_8: Marker2D = $Markers_Sticknodes/SticknodeSpawn8

@onready var finish_star_appear: Marker2D = $FinishStarAppear

#SpawnSticknodes
@onready var sticknode_spawn_sprite: AnimatedSprite2D = $SticknodeSpawn_Sprites/SticknodeSpawnSprite
@onready var sticknode_spawn_sprite_2: AnimatedSprite2D = $SticknodeSpawn_Sprites/SticknodeSpawnSprite2
@onready var sticknode_spawn_sprite_3: AnimatedSprite2D = $SticknodeSpawn_Sprites/SticknodeSpawnSprite3
@onready var sticknode_spawn_sprite_4: AnimatedSprite2D = $SticknodeSpawn_Sprites/SticknodeSpawnSprite4
@onready var sticknode_spawn_sprite_5: AnimatedSprite2D = $SticknodeSpawn_Sprites/SticknodeSpawnSprite5
@onready var sticknode_spawn_sprite_6: AnimatedSprite2D = $SticknodeSpawn_Sprites/SticknodeSpawnSprite6
@onready var sticknode_spawn_sprite_7: AnimatedSprite2D = $SticknodeSpawn_Sprites/SticknodeSpawnSprite7
@onready var sticknode_spawn_sprite_8: AnimatedSprite2D = $SticknodeSpawn_Sprites/SticknodeSpawnSprite8

#Timers
@onready var idle_wait_timer: Timer = $Timers/IdleWaitTimer
@onready var idle_wait_timer_half: Timer = $Timers/IdleWaitTimerHalf
@onready var teleport_timer: Timer = $Timers/TeleportTimer

#Hitboxes
@onready var collision_hurtbox: CollisionShape2D = $Hurtbox/CollisionHurtbox
@onready var main_hit_box: CollisionShape2D = $MainHitBox


var is_attacking_right = false
var is_dead = false
var has_taken_damaged = false
var is_teleporting = false
var can_attack = false
var is_attacking = false
var can_teleport = true
var has_summon = false
var is_shield = false

#Summon Stuff
@onready var sticknodes = preload("res://scenes/characters/enemy/enemy_sticknode_boss.tscn")
@onready var boxingglove = preload("res://scenes/characters/bosses/pete/pete_windows_boxing_glove.tscn")
@onready var cannon = preload("res://scenes/characters/bosses/pete/pete_windows_beam_cannon.tscn")
@onready var cannon_left = preload("res://scenes/characters/bosses/pete/pete_windows_beam_cannon_left.tscn")
var sticknode_path = ""
var sticknode_path2 = ""
var sticknode_path3 = ""
var sticknode_path4 = ""
var sticknode_path5 = ""
var sticknode_path6 = ""
var sticknode_path7 = ""
var sticknode_path8 = ""
var boxingglove_path = ""
var cannon_path = ""
var star_path = ""

var summstick : Array = [3]

var sticknodeamount = 0

func _ready() -> void:
	randomchance = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	if sticknodeamount >= 1:
		can_teleport = false
	else:
		can_teleport = true
		has_summon = false
		if is_shield:
			collision_hurtbox.disabled = false
			main_hit_box.disabled = false

func startattack():
	pete_anim.play("idle")
	eyes.play("idle")
	moustache.play("idle")
	mouth.play("idle")
	is_attacking_right = false
	collision_hurtbox.disabled = false
	if game_manager.boss_health <= 4:
		idle_wait_timer_half.start()
	else:
		idle_wait_timer.start()

func startteleport():
	pete_anim.play("teleport_in")
	is_shield = true

func teleporting():
	var spawnposchance = randomchance.randi_range(1, 40)
	pete_body.visible = false
	is_teleporting = true
	is_shield = true
	teleport_timer.start()
	collision_hurtbox.disabled = true
	main_hit_box.disabled = true
	if spawnposchance >= 40 && can_teleport:
		global_position = teleport_spawn_4.global_position
	if spawnposchance >= 30 && can_teleport:
		global_position = teleport_spawn_3.global_position
	if spawnposchance >= 20 && can_teleport:
		global_position = teleport_spawn_2.global_position
	else:
		if can_teleport:
			global_position = teleport_spawn.global_position

func _on_teleport_timer_timeout() -> void:
	pete_anim.play("teleport_out")
	eyes.play("summon")
	mouth.play("teleport_out")
	pete_body.visible = true
	is_teleporting = false
	is_shield = false
	teleport_timer.stop()

func windows_attack():
	var windowschance = randomchance.randi_range(1, 10)
	var positionchance = randomchance.randi_range(1, 10)
	is_attacking = true
	if positionchance >= 5:
		is_attacking_right = true
	else:
		is_attacking_right = false
	if is_attacking_right:
		pete_anim.play("attack_right")
		if windowschance >= 5:
			attack_beam_cannon.play()
			windows_pop_up_sfx.play()
			var scene = get_node("../../") 
			var Cannon = cannon_left.instantiate()
			Cannon.global_position = beam_cannon_windows_spawn_b.global_position
			scene.add_child(Cannon)
			Cannon.is_facingleft = true
		else:
			attack_boxing_glove.play()
			windows_pop_up_sfx.play()
			
			var scene = get_node("../") 
			var Glove = boxingglove.instantiate()
			Glove.global_position = punch_glove_windows_spawn_b.global_position
			scene.add_child(Glove)
	else:
		pete_anim.play("attack_left")
		if windowschance >= 5:
			attack_beam_cannon.play()
			windows_pop_up_sfx.play()
			var scene = get_node("../../") 
			var Cannon = cannon.instantiate()
			Cannon.global_position = beam_cannon_windows_spawn_a.global_position
			scene.add_child(Cannon)
		else:
			attack_boxing_glove.play()
			windows_pop_up_sfx.play()
			var scene = get_node("../") 
			var Glove = boxingglove.instantiate()
			Glove.global_position = punch_glove_windows_spawn_a.global_position
			scene.add_child(Glove)


func _on_idle_wait_timer_timeout() -> void:
	var attackchance = randomchance.randi_range(1, 3)
	if attackchance == 3:
		windows_attack()
	if attackchance == 2:
		if not has_summon:
			startsummon()
		else:
			windows_attack()
	if attackchance == 1:
		if can_teleport:
			startteleport()
		else:
			windows_attack()
	idle_wait_timer.stop()

func spawn_star():
	var scene = get_node("../../")
	star_path = "res://scenes/collectable/finish_star.tscn"
	var FinishStar = load(star_path).instantiate()
	FinishStar.global_position = finish_star_appear.global_position
	scene.add_child(FinishStar)

func boss_took_damaged():
	game_manager.boss_lose_health()
	pete_anim.play("damage")
	eyes.play("damage")
	moustache.play("damage")
	mouth.play("damage")
	has_taken_damaged = true
	damage.play()
	damage_sfx.play()
	
func boss_defeated():
	game_manager.boss_lose_health()
	eyes.play("damage")
	moustache.play("damage")
	mouth.play("damage")
	pete_anim.play("defeat")
	pete_windows_anim.play("defeat")
	is_dead = true
	is_shield = true
	defeat.play()
	defeat_sfx.play()
	idle_wait_timer.stop()
	idle_wait_timer_half.stop()
	game_manager.finish_boss()

func boss_disappear():
	spawn_star()
	queue_free()


func _on_sticknode_spawn_sprite_frame_changed() -> void:
	if sticknode_spawn_sprite.animation == "default":
		if sticknode_spawn_sprite.frame in summstick:
			var scene = get_node("../../MeanBalls/")
			var SticknodeA = sticknodes.instantiate()
			SticknodeA.global_position = sticknode_spawn.global_position
			scene.add_child(SticknodeA)
			sticknodeamount += 1
			has_summon = true
			sticknode_spawn_sprite.visible = false
			sticknodecount()


func _on_sticknode_spawn_sprite_2_frame_changed() -> void:
	if sticknode_spawn_sprite_2.animation == "default":
		if sticknode_spawn_sprite_2.frame in summstick:
			var scene = get_node("../../MeanBalls/")
			sticknode_path2 = "res://scenes/characters/enemy/enemy_sticknode_boss.tscn"
			var SticknodeB = sticknodes.instantiate()
			SticknodeB.global_position = sticknode_spawn_2.global_position
			scene.add_child(SticknodeB)
			sticknodeamount += 1
			has_summon = true
			sticknode_spawn_sprite_2.visible = false
			sticknodecount()


func _on_sticknode_spawn_sprite_3_frame_changed() -> void:
	if sticknode_spawn_sprite_3.animation == "default":
		if sticknode_spawn_sprite_3.frame in summstick:
			var scene = get_node("../../MeanBalls/")
			sticknode_path3 = "res://scenes/characters/enemy/enemy_sticknode_boss.tscn"
			var SticknodeC = sticknodes.instantiate()
			SticknodeC.global_position = sticknode_spawn_3.global_position
			scene.add_child(SticknodeC)
			sticknodeamount += 1
			has_summon = true
			sticknode_spawn_sprite_3.visible = false
			sticknodecount()


func _on_sticknode_spawn_sprite_4_frame_changed() -> void:
	if sticknode_spawn_sprite_4.animation == "default":
		if sticknode_spawn_sprite_4.frame in summstick:
			var scene = get_node("../../MeanBalls/")
			sticknode_path4 = "res://scenes/characters/enemy/enemy_sticknode_boss.tscn"
			var SticknodeD = sticknodes.instantiate()
			SticknodeD.global_position = sticknode_spawn_4.global_position
			scene.add_child(SticknodeD)
			sticknodeamount += 1
			has_summon = true
			sticknode_spawn_sprite_4.visible = false
			sticknodecount()


func _on_sticknode_spawn_sprite_5_frame_changed() -> void:
	if sticknode_spawn_sprite_5.animation == "default":
		if sticknode_spawn_sprite_5.frame in summstick:
			var scene = get_node("../../MeanBalls/")
			sticknode_path5 = "res://scenes/characters/enemy/enemy_sticknode_boss.tscn"
			var SticknodeE = sticknodes.instantiate()
			SticknodeE.global_position = sticknode_spawn_5.global_position
			scene.add_child(SticknodeE)
			sticknodeamount += 1
			has_summon = true
			sticknode_spawn_sprite_5.visible = false
			sticknodecount()


func _on_sticknode_spawn_sprite_6_frame_changed() -> void:
	if sticknode_spawn_sprite_6.animation == "default":
		if sticknode_spawn_sprite_6.frame in summstick:
			var scene = get_node("../../MeanBalls/")
			sticknode_path6 = "res://scenes/characters/enemy/enemy_sticknode_boss.tscn"
			var SticknodeF = sticknodes.instantiate()
			SticknodeF.global_position = sticknode_spawn_6.global_position
			scene.add_child(SticknodeF)
			sticknodeamount += 1
			has_summon = true
			sticknode_spawn_sprite_6.visible = false
			sticknodecount()


func _on_sticknode_spawn_sprite_7_frame_changed() -> void:
	if sticknode_spawn_sprite_7.animation == "default":
		if sticknode_spawn_sprite_7.frame in summstick:
			var scene = get_node("../../MeanBalls/")
			sticknode_path7 = "res://scenes/characters/enemy/enemy_sticknode_boss.tscn"
			var SticknodeG = sticknodes.instantiate()
			SticknodeG.global_position = sticknode_spawn_7.global_position
			scene.add_child(SticknodeG)
			sticknodeamount += 1
			has_summon = true
			sticknode_spawn_sprite_7.visible = false
			sticknodecount()


func _on_sticknode_spawn_sprite_8_frame_changed() -> void:
	if sticknode_spawn_sprite_8.animation == "default":
		if sticknode_spawn_sprite_8.frame in summstick:
			var scene = get_node("../../MeanBalls/")
			sticknode_path8 = "res://scenes/characters/enemy/enemy_sticknode_boss.tscn"
			var SticknodeH = sticknodes.instantiate()
			SticknodeH.global_position = sticknode_spawn_8.global_position
			scene.add_child(SticknodeH)
			sticknode_spawn_sprite_8.visible = false
			sticknodecount()

func startsummon():
	has_summon = true
	is_shield = true
	var sticksummon = randomchance.randi_range(1, 8)
	pete_anim.play("summon")
	eyes.play("summon")
	mouth.play("summon")
	summon.play()
	summon_sfx.play()
	if sticksummon >= 1:
		sticknode_spawn_sprite.play("default")
		sticknode_spawn_sprite.visible = true
	if sticksummon >= 2:
		sticknode_spawn_sprite_2.play("default")
		sticknode_spawn_sprite_2.visible = true
	if sticksummon >= 3:
		sticknode_spawn_sprite_3.play("default")
		sticknode_spawn_sprite_3.visible = true
	if sticksummon >= 4:
		sticknode_spawn_sprite_4.play("default")
		sticknode_spawn_sprite_4.visible = true
	if sticksummon >= 5:
		sticknode_spawn_sprite_5.play("default")
		sticknode_spawn_sprite_5.visible = true
	if sticksummon >= 6:
		sticknode_spawn_sprite_6.play("default")
		sticknode_spawn_sprite_6.visible = true
	if sticksummon >= 7:
		sticknode_spawn_sprite_7.play("default")
		sticknode_spawn_sprite_7.visible = true
	if sticksummon >= 8:
		sticknode_spawn_sprite_8.play("default")
		sticknode_spawn_sprite_8.visible = true
	collision_hurtbox.disabled = true
	main_hit_box.disabled = false

func sticknodecount():
	print("Sticknode Amount:" + str(sticknodeamount))
	print("Has already Summon:" + str(has_summon))
	print("Can teleport:" + str(has_summon))


func _on_idle_wait_timer_half_timeout() -> void:
	var attackchance = randomchance.randi_range(1, 3)
	if attackchance == 3:
		windows_attack()
	if attackchance == 2:
		if not has_summon:
			startsummon()
		else:
			windows_attack()
	if attackchance == 1:
		if can_teleport:
			startteleport()
		else:
			windows_attack()
	idle_wait_timer_half.stop()
