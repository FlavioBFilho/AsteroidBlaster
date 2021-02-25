extends Node2D

onready var boom = preload("res://scenes/boom.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func destroy(var pos_x, var pos_y):
	var explosion = boom.instance()
	explosion.gravity_scale=0
	explosion.position = Vector2(pos_x,pos_y)
	add_child(explosion)
