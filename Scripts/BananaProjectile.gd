extends CharacterBody2D

@export var Speed = 2500

var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot
	

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -Speed).rotated(dir)
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()


func _on_timer_2_timeout() -> void:
	$AnimationPlayer.play("Die")
	$Timer.start()
