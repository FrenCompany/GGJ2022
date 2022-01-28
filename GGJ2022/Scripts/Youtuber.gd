extends KinematicBody2D

export var vel = 250



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var vel_actual = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
			vel_actual.x += vel 
	if Input.is_action_pressed("ui_left"):
			vel_actual.x -= vel
	if Input.is_action_pressed("ui_down"):
			vel_actual.y += vel 
	if Input.is_action_pressed("ui_up"):
			vel_actual.y -= vel
	move_and_slide(vel_actual)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
