extends Control

signal change_plant

var group = preload("res://NameListButtonGroup.tres")
var name_list

onready var scroll_container = $VBoxContainer/ScrollContainer/VBoxContainer
onready var parent = get_parent()

func _ready():
	draw_buttons()


func draw_buttons():
	name_list = ProgrammManager.get_name_list()
	for i in range(0,scroll_container.get_child_count()):
		scroll_container.get_child(i).queue_free()
	for i in range(0, name_list.size()):
		generate_button(name_list[i])


func generate_button(text:String):
	var button = Button.new()
	button.text = text
	button.name = text
	button.rect_min_size.y = 30
	button.rect_min_size.x = 400
	button.group = load("res://NameListButtonGroup.tres")
	scroll_container.add_child(button)
	button.connect("button_down", self, "_on_button_down")


func _on_button_down():
	ProgrammManager.name_list_pressed_name = group.get_pressed_button().name
	emit_signal("change_plant")



func _on_MainPage_refresh_list():
	draw_buttons()













