extends Node2D

var speed = 250
var game
var rt = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("asteroides")
	game = get_tree().current_scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos_y = position.y
	pos_y -= speed*delta
	position.y = pos_y
	if position.y>=776:
		queue_free()
		
	$asteroid2.rotate(rt)
	rt+=0.00035
	
func Dano():
	game.get_child(4).destroy(position[0],position[1])
	queue_free()
