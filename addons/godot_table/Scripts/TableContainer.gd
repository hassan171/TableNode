tool

extends VBoxContainer

signal Pressed(value)
const HeaderContainer = preload("res://addons/godot_table/Scripts/headerContainer.gd")
const RowContainer = preload("res://addons/godot_table/Scripts/rowContainer.gd")
const RowBtn = preload("res://addons/godot_table/Scripts/rowBtns.gd")

var v_scrollbar : VScrollBar
var headerPanelPlus : Panel
var headerContainer : GridContainer
var rowContainer : GridContainer
var rowBtn : VBoxContainer

func _on_vscrollbar_visibility_changed():
	if v_scrollbar.visible == true:
		headerPanelPlus.rect_min_size.x = v_scrollbar.rect_size.x
	else:
		headerPanelPlus.rect_min_size.x = 0


func _ready():
	v_scrollbar = self.get_node("ScrollContainer").get_v_scrollbar()
# warning-ignore:return_value_discarded
	v_scrollbar.connect("visibility_changed", self, "_on_vscrollbar_visibility_changed")


func init_tree():
	headerContainer = self.get_node("HBoxContainer/headerContainer")
	headerPanelPlus = self.get_node("HBoxContainer/PanelPlus")
	rowContainer = self.get_node("ScrollContainer/PanelContainer/rowContainer")
	rowBtn = self.get_node("ScrollContainer/PanelContainer/rowBtns")

func set_header(values):
	headerContainer.set_heads(values)

func set_rows(values):
	rowContainer.set_rows(values,headerContainer.columns)
	rowBtn.set_rows(values.size())
	
	for x in rowBtn.get_children().size():
		if not rowBtn.get_child(x).is_connected("pressed",self,"btn_pressed"):
# warning-ignore:return_value_discarded
			rowBtn.get_child(x).connect("pressed",self,"btn_pressed",[x])

func btn_pressed(x):
	emit_signal("Pressed", rowContainer.get_row_data(x))
