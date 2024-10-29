extends Area2D

func _ready() -> void:
	$Sprite2D.modulate = "#ffffff00"
	$AnimationPlayer.play("Spawn")


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		Global.Score += randi_range(1, 3)
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("Eat")
		$Timer.start()

func _process(delta: float) -> void:
	$Sprite2D.rotate(0.01)


func _on_timer_timeout() -> void:
	queue_free()
