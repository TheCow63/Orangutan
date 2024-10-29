extends Node

var SpawnAmount
@onready var Banana = load("res://Scenes/Banana.tscn")

func SpawnBanana():
	var Instance = Banana.instantiate()
	Instance.position = $SpawnLocations.get_child(randi_range(0, 31)).position
	add_child(Instance)

func _on_timer_timeout() -> void:
	SpawnBanana()
