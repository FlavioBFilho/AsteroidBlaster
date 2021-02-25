extends Node2D


var score = 0
# var b = "text"
var power
var fuel

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Label.text = str(score)
	$CanvasLayer/ProgressBar.visible = false
	power = false
	fuel = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if power:
		$CanvasLayer/ProgressBar.value = $nave/spawn_tiro/power_up.time_left
	
	fuel = fuel-0.05
	$CanvasLayer/ProgressBar2.value = fuel
	if fuel<=0:
		if $nave/game_over.is_stopped():
			$nave/game_over.start()
			$nave/turbinas.visible = false
			$nave/spawn_tiro.desativar()
		
func addScore(altura):
	if altura>=320:
		score+=2
	else:
		score+=1
	$CanvasLayer/Label.text = str(score)
	

func _on_game_over_timeout():
	SaveScore.last_score = score
	SaveScore.recorde = false
	if score > SaveScore.best_score:
		SaveScore.best_score = score
		SaveScore.recorde = true
	get_tree().change_scene("res://scenes/game_over.tscn")
	
	
func ativa_power():
	power = true
	$CanvasLayer/ProgressBar.visible = true

func abastecer():
	fuel = 100

func pause():
	get_tree().paused = true
	$CanvasLayer/Label2.visible = true
	$CanvasLayer/Button.visible = true
	$CanvasLayer/Button2.visible = true
	$TouchScreenButton.visible = false


func resume():
	get_tree().paused = false
	$CanvasLayer/Label2.visible = false
	$CanvasLayer/Button.visible = false
	$CanvasLayer/Button2.visible = false
	$TouchScreenButton.visible = true


func quit():
	_on_game_over_timeout()
	get_tree().paused = false
