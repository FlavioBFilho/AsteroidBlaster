extends Node2D


var speed = 250

func _ready():
	pass


func _process(delta):
	var pos_y = position.y
	pos_y -= speed*delta
	position.y = pos_y
