extends KinematicBody2D

export var dir = Vector2(0,0)
export var vel = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	dir = Vector2(randi()%3-1,randi()%3-1)
	if dir == Vector2(0,0):
		dir = Vector2(0,1)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(delta * vel * dir)
	if collision:
		dir = dir.bounce(collision.normal)
