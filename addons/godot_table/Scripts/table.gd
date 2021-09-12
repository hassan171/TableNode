tool
extends PanelContainer

signal Pressed(value)

const TableContainer = preload("res://addons/godot_table/Scripts/TableContainer.gd")

export (Array, String) var column_headers setget _set_column_headers

export(Array, Array, String) var rows setget set_rows


var preload_tableContainer : PackedScene = preload("res://addons/godot_table/TableContainer.tscn")


var tableContainer : TableContainer
var headerContainer : GridContainer
var rowContainer : GridContainer


func _init():
	_init_tree()

func _init_tree():
	tableContainer = preload_tableContainer.instance()
	self.add_child(tableContainer, true)
	tableContainer.init_tree()

func _ready():
	if not is_connected("Pressed",self,"_on_RowButtonContainer_CLICK_ROW"):
# warning-ignore:return_value_discarded
		tableContainer.connect("Pressed", self, "_on_RowButtonContainer_CLICK_ROW")
	


func _set_column_headers(values:Array):
	column_headers=values
	tableContainer.set_header(values)
	set_rows(rows)

func set_rows(values):
	rows=values
	
	for row  in rows:
		
		var row_columns = row.size()
		var header_columns = column_headers.size()
		
		if row_columns > header_columns:
# warning-ignore:unused_variable
			for index in range(row_columns - header_columns):
				row.remove(row.size()-1)
		elif row_columns < header_columns:
# warning-ignore:unused_variable
			for index in range(header_columns - row_columns):
				row.push_back("")

	tableContainer.set_rows(values)

func _on_RowButtonContainer_CLICK_ROW(value):
	emit_signal("Pressed", value)


func _on_PanelContainer_Pressed(value):
	print(value)
