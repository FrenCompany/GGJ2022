extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var time = 60
var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeOut",self,"on_timer_out")
	timer.set_wait_time(time)
	add_child(timer)
	timer.start()
func _process(delta):
	$RichTextLabel.bbcode_text="[center]"+str(int(timer.time_left))+"[/center]"#str(minutes) + ":" + str(seconds) + ":" + str(milliseconds))
	

func on_timer_out():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.

