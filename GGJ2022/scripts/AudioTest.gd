extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$DistanceAudio.set_listener_pos(get_viewport().get_mouse_position())
	$DistanceAudio2.set_listener_pos(get_viewport().get_mouse_position())
	$DistanceAudio3.set_listener_pos(get_viewport().get_mouse_position())
