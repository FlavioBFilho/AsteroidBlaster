extends Node2D


# Declare member variables here. Examples:
var try = true
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Label3/Label.text = str(SaveScore.last_score)
	$CanvasLayer/Label4/Label.text = str(SaveScore.best_score)
	
	if SaveScore.recorde:
		$CanvasLayer/Label5.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_try_btn_pressed():
	try = true
	$Timer.start()
	$AudioStreamPlayer2D.play()


func _on_quit_btn_pressed():
	try = false
	$Timer.start()
	$AudioStreamPlayer2D.play()


func _on_Timer_timeout():
	if try:
		get_tree().change_scene("res://scenes/fase1.tscn")
	else:
		get_tree().quit()
