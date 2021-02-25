extends Node2D

onready var bullet = preload("res://scenes/bullet.tscn")
var game
var tiro_duplo
var desativado
# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_tree().current_scene
	tiro_duplo = false
	desativado = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func create_shot():
	var nave = self.get_parent()
	var pos_x = nave.position[0]
	
	if not tiro_duplo:
		var shot = bullet.instance()
		shot.gravity_scale=0
		shot.position = Vector2(pos_x,536)
		
		game.add_child(shot)
	else:
		var shot1 = bullet.instance()
		shot1.gravity_scale=0
		shot1.position = Vector2(pos_x+45,584)
		
		var shot2 = bullet.instance()
		shot2.gravity_scale=0
		shot2.position = Vector2(pos_x-52,584)
		
		game.add_child(shot1)
		game.add_child(shot2)
		

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and not desativado:
		create_shot()
		$AudioStreamPlayer2D.play(0.69)
	
func duplicar_tiro():
	tiro_duplo = true
	
func desativar():
	desativado = true

func _on_power_up_timeout():
	tiro_duplo = false
	$"../../CanvasLayer/ProgressBar".visible = false
