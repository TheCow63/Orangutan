extends Node

var SpawnAmount
@onready var Orangutan = load("res://Scenes/Orangutan.tscn")

func SpawnOrangutan():
	var Instance = Orangutan.instantiate()
	Instance.position = $SpawnLocations.get_child(randi_range(0, 31)).position
	add_child(Instance)

func _on_timer_timeout() -> void:
	SpawnOrangutan()
