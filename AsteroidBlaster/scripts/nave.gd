extends RigidBody2D

const SPEED = 200
var dir = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(0,0)
	dir = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dir = 0
	linear_velocity = Vector2(0,0)
	if $game_over.is_stopped():
		if Input.is_action_pressed("ui_right") and position[0]<308.10:
			linear_velocity = Vector2(SPEED,0)
		if Input.is_action_pressed("ui_left") and position[0]>52.22:
			linear_velocity = Vector2(SPEED*-1,0)


func _on_Area2D_body_entered(body):
	if body.is_in_group("asteroides"):
		body.Dano()
		$game_over.start()	
		$"../spawn_boom".destroy(position[0],position[1])
		visible = false
		$spawn_tiro.desativar()
		$CollisionShape2D.queue_free()
		$Area2D.queue_free()


func _on_Area2D_area_entered(area):
	if area.name == "power":
		$spawn_tiro.duplicar_tiro()
		$spawn_tiro/power_up.start()
		area.get_parent().queue_free()
		$"..".ativa_power()
		
	elif area.name == "fuel":
		$"..".abastecer()
		area.get_parent().queue_free()
