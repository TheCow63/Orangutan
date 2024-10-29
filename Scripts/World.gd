extends Node2D

func _physics_process(delta: float) -> void:
	$CanvasLayer/Label.text = str(Global.Score)
