extends Node2D


# Declare member variables here. Examples:
var start = true
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_btn_pressed():
	start = true
	$Timer.start()
	$explosao.play()


func _on_quit_btn_pressed():
	start = false
	$Timer.start()
	$explosao.play()

func _on_Timer_timeout():
	if start:
		get_tree().change_scene("res://scenes/fase1.tscn")
	else:
		get_tree().quit()
		
