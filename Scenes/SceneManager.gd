extends Node2D

# popcorn enemies
@onready var single_enemy_center = preload("res://Scenes/SpawnPatterns/Formation1.tscn")
@onready var three_enemy_left = preload("res://Scenes/SpawnPatterns/Formation2.tscn")
@onready var three_enemy_right = preload("res://Scenes/SpawnPatterns/Formation3.tscn")

# large enemies
@onready var single_big_enemy_left = preload("res://Scenes/SpawnPatterns/Formation4.tscn")
@onready var single_big_enemy_right = preload("res://Scenes/SpawnPatterns/Formation5.tscn")

# path2d / fancy-pants enemies
@onready var many_zigzag_enemy = preload("res://Scenes/SpawnPatterns/Formation6.tscn")
@onready var many_swarm_enemy_to_right = preload("res://Scenes/SpawnPatterns/Formation7.tscn")
@onready var many_swarm_enemy_to_left = preload("res://Scenes/SpawnPatterns/Formation8.tscn")

@onready var boss = preload("res://Scenes/SpawnPatterns/SpawnBoss.tscn")

@onready var current_song = $"Music/Heavy Metal Rain"

func singleEnemyCenter() -> void:
	var inst = single_enemy_center.instantiate()
	add_child(inst)


func threeEnemyLeft() -> void:
	var inst = three_enemy_left.instantiate()
	add_child(inst)


func threeEnemyRight() -> void:
	var inst = three_enemy_right.instantiate()
	add_child(inst) 

	
func bigEnemyLeft() -> void:
	var inst = single_big_enemy_left.instantiate()
	add_child(inst) 


func bigEnemyRight() -> void:
	var inst = single_big_enemy_right.instantiate()
	add_child(inst) 


func manyEnemyZigZag() -> void:
	var inst = many_zigzag_enemy.instantiate()
	add_child(inst) 

	
func manyEnemyRight() -> void:
	var inst = many_swarm_enemy_to_left.instantiate()
	add_child(inst) 
	
	
func manyEnemyLeft() -> void:
	var inst = many_swarm_enemy_to_right.instantiate()
	add_child(inst) 
	
func bossFight() -> void:
	var inst = boss.instantiate()
	add_child(inst)

func displayWarning() -> void:
	$WarningPlayer.play('warning')
	
func audioHeavyMetalRain() -> void:
	current_song.stop()
	current_song = $"Music/Heavy Metal Rain"
	current_song.play()
	
func audioExecutioner() -> void:
	current_song.stop()
	current_song = $"Music/Executioner (Boss Fight)"
	current_song.play()
	
func audioWarning() -> void:
	displayWarning()
	$Music/Warning.play()
	$WarningMusicTimer.start()



func _on_area_2d_area_entered(area):
	if 'can_shoot' in area and area.name != "Boss":
		area.can_shoot = true
		area.can_die = true


func _on_deletion_zone_area_entered(area):
	print(area.name + ' despawned')
	area.queue_free()
	

func _ready():
	current_song.play()



func _on_warning_music_timer_timeout():
	current_song.stop()
