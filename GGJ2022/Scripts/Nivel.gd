extends Node2D


# Declare member variables here. Examples:
var atract_repel_count = {
	"attract": 0,
	"repel": 0
}


# Called when the node enters the scene tree for the first time.
func _ready():
	
	for attract_repel_object in $EntityLayer/AttractRepelObjets.get_children():
		attract_repel_object.connect("gets_visible", self, "add_visible")
		attract_repel_object.connect("gets_invisible", self, "add_invisible")


func add_visible(type):
	atract_repel_count[type] += 1
	update_attract_repel_audio()


func add_invisible(type):
	atract_repel_count[type] -= 1
	update_attract_repel_audio()


func update_attract_repel_audio():
	if atract_repel_count['attract'] == 0 and $AttractSound.is_playing():
		$AttractSound.stop()
	elif atract_repel_count['attract'] > 0 and (not $AttractSound.is_playing()):
		$AttractSound.play()
	
	if atract_repel_count['repel'] == 0 and $RepelSound.is_playing():
		$RepelSound.stop()
	elif atract_repel_count['repel'] > 0 and (not $RepelSound.is_playing()):
		$RepelSound.play()


func on_goal_reached(body):
	$EntityLayer/Goal.queue_free()
	print("nivel terminado")
	$LevelFinishedSound.play()
