extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed*delta
	if position.y>=776:
		queue_free()
