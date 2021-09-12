tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("Table", "PanelContainer", preload("res://addons/godot_table/Scripts/table.gd"), preload("res://addons/godot_table/icon.svg"))


func _exit_tree():
	remove_custom_type("Table")
