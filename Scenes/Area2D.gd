extends Area2D

var entered = false 


func _on_body_entered():
	entered = true
	get_tree().change_scene_to_file("res://level_2.tscn")
	print("Entered")
	

func _on_body_exited(body):
	entered = false

func _process(delta):
	"""if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree.change_scene_to_file("res://level_2.tscn")"""
	
