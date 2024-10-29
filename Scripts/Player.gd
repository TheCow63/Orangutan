extends RigidBody2D

var Speed = 1200
var Jump = 0
var Jumpforce = 120000

func _physics_process(delta: float) -> void:
	Global.PlayerPos = global_position
	if Input.is_action_pressed("Left"):
		apply_central_force(Vector2(-Speed, 0))
	if Input.is_action_pressed("Right"):
		apply_central_force(Vector2(Speed, 0))
	if Input.is_action_just_pressed("Jump"):
		if Jump > 0:
			$AnimationPlayer.play("Jump")
			apply_central_force(Vector2(0, -Jumpforce))
			Jump -= 1
	print(Jump)
			



func _on_area_2d_body_entered(body: Node2D) -> void:
	Jump = 1
