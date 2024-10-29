extends Node2D

var CanShoot = 1
var offset = 165
@onready var main = get_tree().get_root().get_node("World")
@onready var projectile = load("res://Scenes/BananaProjectile.tscn")

func shoot():
	Global.Score -= 1
	CanShoot = 0
	$Timer.start()
	look_at(get_global_mouse_position())
	var instance = projectile.instantiate()
	instance.dir = rotation + offset
	instance.spawnPos = global_position
	instance.spawnRot = rotation + offset
	main.add_child.call_deferred(instance)

func _physics_process(delta: float) -> void:
	global_position = Global.PlayerPos
	if Input.is_action_pressed("Shoot"):
		if CanShoot == 1 and Global.Score > 0:
			shoot()


func _on_timer_timeout() -> void:
	CanShoot = 1
