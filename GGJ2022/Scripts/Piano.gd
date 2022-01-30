extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var piano_bounce = [
	preload("res://assets/Sfx/bouncepiano1.ogg"),
	preload("res://assets/Sfx/bouncepiano2.ogg"),
	preload("res://assets/Sfx/bouncepiano3.ogg"),
	preload("res://assets/Sfx/bouncepiano4.ogg"),
	preload("res://assets/Sfx/bouncepiano5.ogg")
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func affect_ghost( ghost ):
	randomize()
	$PianoPlayer.stream = piano_bounce[randi()%len(piano_bounce)]
	$PianoPlayer.play()
