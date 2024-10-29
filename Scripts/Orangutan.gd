extends CharacterBody2D

var Gravity = 2000
const Speed = 500.0
var Die = 0


func _physics_process(delta: float) -> void:
	
	if position.x < Global.PlayerPos.x:
		velocity.x = Speed
	else:
		velocity.x = -Speed
		
	
	if not is_on_floor():
		velocity.y += Gravity * delta

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("BananaProjectile"):
		Die = 1
		$AnimationPlayer.play("Die")
		$Timer.start()
	if area.is_in_group("Player"):
		if Die == 0:
			get_tree().change_scene_to_file("res://Scenes/Retry.tscn")
		


func _on_timer_timeout() -> void:
	queue_free()
