extends Node

var VP = Vector2.ZERO

var score = 0
var time = 10
var lives = 5


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
	


func _resized():
	VP = get_viewport().size
	
func reset():
	get_tree().paused = false
	score = 0
	time = 100
	lives = 5
	
func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()
	
func update_lives(l):
	score += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_lives()
		
func update_time(t):
	score += t
	if time <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_time()
