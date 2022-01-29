extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	get_parent().get_node("Timer/Timer").connect("timeout", self, "on_timer_out")
	
	
func on_timer_out():
	print("timer out")
	visible = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
