extends Area2D

signal afectar_mov
signal gets_visible(type)
signal gets_invisible(type)

# define si atrae (+) o repele (-) al fantasma y con que fuerza
export var influencia = 1

export var dist_min_influencia = 100
export var dist_max_influencia = 200

# es visible en el espejo?
var _en_espejo = false


# Called when the node enters the scene tree for the first time.
func _init():
	add_to_group("afecta_mov")

func _ready():
	var escala = dist_max_influencia / 50.0
	$SpriteAntiguo.scale = Vector2(escala, escala)
	if influencia > 0:
		$SpriteAntiguo.modulate = Color(1, 1, 0)
	else:
		$SpriteAntiguo.modulate = Color(1, 0, 0)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if _en_espejo:
		emit_signal('afectar_mov', self)


func registrar_espejo(espejo):
	espejo.connect("area_entered", self, "entro_espejo")
	espejo.connect("area_exited", self, "salio_espejo")


func entro_espejo(area):
	if area == self:
		_en_espejo = true
		self.emit_visible()
		$SpriteAntiguo.visible = true


func salio_espejo(area):
	if area == self:
		_en_espejo = false
		self.emit_invisible()
		$SpriteAntiguo.visible = false


func registrar_fantasma(fantasma):
	self.connect("afectar_mov", fantasma, "_on_afectar_mov")


func afectar_mov_fantasma(fantasma):
	var distancia = position.distance_to(fantasma.position)

	if dist_min_influencia <= distancia and distancia <= dist_max_influencia:
		var direccion = fantasma.position.direction_to(position)
		fantasma.dir = direccion * influencia * fantasma.vel_max


func get_type():
	if (self.influencia > 0):
		return 'attract'
	else:
		return 'repel'


func emit_visible():
	var type = self.get_type()
	emit_signal("gets_visible", type)


func emit_invisible():
	var type = self.get_type()
	emit_signal("gets_invisible", type)
