extends Area2D

@onready var anim := $AnimationPlayer as AnimationPlayer
@export var speed : float = 500
@export var damage : float = 1

func _ready():
	anim.play('fire')


func _physics_process(delta):
	position += transform.x * speed * delta
		
	

func _on_area_entered(area):
	if area.has_method('hit'):
		area.hit(damage)
		queue_free()


func on_viewport_exited(_viewport):
	queue_free()

