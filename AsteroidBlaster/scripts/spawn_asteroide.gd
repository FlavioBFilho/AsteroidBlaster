extends Node2D

onready var asteroide = preload("res://scenes/asteroide.tscn")
var start_position_x = 200
var start_position_y = -200
var desativado

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func create_clone():
	if $"../nave/game_over".is_stopped():
		var clone = asteroide.instance()
		clone.position = Vector2(rand_range(50,310),start_position_y)
		add_child(clone)
	else:
		pass

func _on_Timer_timeout():
	create_clone()
