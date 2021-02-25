extends Node2D

onready var asteroide = preload("res://scenes/fuel.tscn")
var start_position_x = 200
var start_position_y = -20

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func create_clone():
	var clone = asteroide.instance()
	clone.position = Vector2(rand_range(10,350),start_position_y)
	add_child(clone)



func _on_Timer_timeout():
	create_clone()
