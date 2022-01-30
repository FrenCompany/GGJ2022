extends KinematicBody2D

export var vel = 250
export var angulo = 45
export var selfie_length = 100
export var max_length = 200
export var min_length = 0
export var extension = 100

export(ShaderMaterial) var material_actual;
export(ShaderMaterial) var material_antiguo;


# Called when the node enters the scene tree for the first time.
func _ready():
	self.update_shader_materials_angle()
	
	var viewport_size = get_viewport().size
	self.material_actual.set_shader_param("screen_ratio", viewport_size.x / viewport_size.y)
	self.material_antiguo.set_shader_param("screen_ratio", viewport_size.x / viewport_size.y)
	
	$SelfieStick/Espejo.position = Vector2(-selfie_length,0)
	#$SelfieStick/Fantasma.position = Vector2(2*-selfie_length,0)
	#$ColisionFantasma.position = $SelfieStick/Fantasma.position
	

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
		$SelfieStick.rotation_degrees -= angulo
		self.update_shader_materials_angle()
	if Input.is_action_just_pressed("ui_cw"):
		$SelfieStick.rotation_degrees += angulo
		self.update_shader_materials_angle()
		
	if Input.is_action_just_pressed("ui_extend"):
		set_length(selfie_length+extension)
	if Input.is_action_just_pressed("ui_retract"):	
		set_length(selfie_length-extension)
	var collision =	move_and_collide(delta*vel_actual)
	
	#collision
	#$SelfieStick/Fantasma.move_and_slide(vel_actual)
	
	self.update_mirror_shader_materials_pos()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_length(length):
	if length<=max_length and length>=min_length:
		selfie_length = length
		$SelfieStick/Espejo.position = Vector2(-selfie_length,0)
		#$SelfieStick/Fantasma.position = Vector2(2*-selfie_length,0)
		#$ColisionFantasma.position = $SelfieStick/Fantasma.position
	

func update_mirror_shader_materials_pos():
	var pos_in_viewport = self.get_global_transform_with_canvas().get_origin()
	var viewport_size = get_viewport().size
	self.material_actual.set_shader_param("pos", Vector2(
		pos_in_viewport.x / viewport_size.x,
		1 - pos_in_viewport.y / viewport_size.y
	))
	
	self.material_antiguo.set_shader_param("pos", Vector2(
		pos_in_viewport.x / viewport_size.x,
		1 - pos_in_viewport.y / viewport_size.y
	))


func update_shader_materials_angle():
	var radians = -$SelfieStick.rotation_degrees / 360.0
	radians -= floor(radians)
	radians *= 2*PI
	
	var dir_x = cos(radians)
	var dir_y = sin(radians)
	
	self.material_actual.set_shader_param("dir", Vector2( dir_x, dir_y ))
	self.material_antiguo.set_shader_param("dir", Vector2( -dir_x, -dir_y ))
