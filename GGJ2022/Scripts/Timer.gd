extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var time = 60


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeOut",self,"on_timer_out")
	$Timer.set_wait_time(time)
	$Timer.start()
	
	set_up_noisy_signals()


func _process(delta):
	$RichTextLabel.bbcode_text="[center]"+str(int($Timer.time_left))+"[/center]"#str(minutes) + ":" + str(seconds) + ":" + str(milliseconds))
	

func on_timer_out():
	pass


func _on_Noisy_noise_produced(noise_object):
	var time_penalization = 5
	var time_left = max($Timer.time_left - time_penalization, 0.1)
	$Timer.set_wait_time(time_left)
	$Timer.start()


func set_up_noisy_signals():
	for child in self.get_node("../../EntityLayer/NoisyObjects").get_children():
		child.connect("noise_produced", self, "_on_Noisy_noise_produced")
