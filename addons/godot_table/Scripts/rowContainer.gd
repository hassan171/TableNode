tool

extends GridContainer

var data

func set_rows(values,size):
	columns=size
	data = values

	for child in get_children():
		child.queue_free()
	
	for v in values.size():
		for x in values[v].size():
			var label = load("res://addons/godot_table/cells/row.tscn").instance()
			label.text=values[v][x]
			label.name = "DATA_%d_%d"%[v, x]
			add_child(label)


func get_row_data(x):
	return data[x]
