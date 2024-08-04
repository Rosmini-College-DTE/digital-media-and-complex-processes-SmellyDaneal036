extends Node

func on_switch_scene():
	print("Switching scene...")
	get_tree().change_scene("res://level_2.tscn")
