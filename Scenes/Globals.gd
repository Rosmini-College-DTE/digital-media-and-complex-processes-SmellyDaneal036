extends Node


func on_switch_scene():
	
	get_tree().change_scene_to_file("res://level_2.tscn")


func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://level_2.tscn")
