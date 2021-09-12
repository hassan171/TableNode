tool

extends VBoxContainer

func set_rows(values):
	
	for child in get_children():
		child.queue_free()
	
	for v in range(values):
		var btn = Button.new()
		btn.flat=true
		btn.rect_size.y=20
		btn.name = "BTN_%d"%[v]
		add_child(btn)
