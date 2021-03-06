extends Area2D


signal noise_produced(noise_object)

# Declare member variables here. Examples:
var sfxs = [
	preload("res://assets/Sfx/glass1.ogg"),
	preload("res://assets/Sfx/glass2.ogg"),
	preload("res://assets/Sfx/glass3.ogg"),
	preload("res://assets/Sfx/glass4.ogg")
]
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",self,"on_body_entered")

func on_body_entered(body):
	randomize()
	$AudioStreamPlayer2D.stream = sfxs[randi()%4]
	$AudioStreamPlayer2D.play()
	
	emit_signal("noise_produced", self)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
