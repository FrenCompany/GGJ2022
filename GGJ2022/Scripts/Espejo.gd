extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group("afecta_mov", "registrar_espejo", self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
