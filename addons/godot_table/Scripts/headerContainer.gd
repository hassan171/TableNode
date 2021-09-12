tool

extends GridContainer

func set_heads(values):
	
	columns=values.size()

	for child in get_children():
		child.queue_free()
	
	for v in range(values.size()):
		var label = load("res://addons/godot_table/cells/column.tscn").instance()
		label.text=values[v]
		label.name = "COLUM_%d"%[v]
		add_child(label)
