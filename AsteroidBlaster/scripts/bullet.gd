extends RigidBody2D

var speed = 800
var game

# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_tree().current_scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed*delta
	if position.y<=-24:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("asteroides"):
		body.Dano()
		game.addScore(position[1])
		queue_free()
		
