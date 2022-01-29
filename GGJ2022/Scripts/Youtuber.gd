extends KinematicBody2D

export var vel = 250
export var selfie_length = 100
export var max_length = 200
export var min_length = 0
export var extension = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	$SelfieStick/Espejo.position = Vector2(-selfie_length,0)
	

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
			
	if Input.is_action_just_pressed("ui_ccw"):
		$SelfieStick.rotation_degrees -= 90
	if Input.is_action_just_pressed("ui_cw"):
		$SelfieStick.rotation_degrees += 90
		
	if Input.is_action_just_pressed("ui_extend"):
		set_length(selfie_length+extension)
	if Input.is_action_just_pressed("ui_retract"):	
		set_length(selfie_length-extension)
	move_and_slide(vel_actual)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_length(length):
	if length<=max_length and length>=min_length:
		selfie_length = length
		$SelfieStick/Espejo.position = Vector2(-selfie_length,0)
	