extends KinematicBody2D

export var dir = Vector2(0,0)
export var vel_max = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	dir = Vector2(randi()%3-1,randi()%3-1).normalized() * vel_max
	if dir == Vector2(0,0):
		dir = Vector2(0, vel_max)

	get_tree().call_group("afecta_mov", "registrar_fantasma", self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(delta * dir)
	if collision:
		
		dir = dir.bounce(collision.normal)
		var collider = collision.collider
		if( collider.has_method("affect_ghost") ):
			collider.affect_ghost(self)
		
		else:
			$BounceSfx.play()
			


func _on_afectar_mov(objeto):
	objeto.afectar_mov_fantasma(self)
