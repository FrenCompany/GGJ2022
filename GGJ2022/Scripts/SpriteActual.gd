extends "res://Scripts/SpriteAntiguo.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$SpriteBothWorlds.texture = texture
	$SpriteBothWorlds.region_enabled = region_enabled
	$SpriteBothWorlds.region_rect = region_rect
	$SpriteBothWorlds.region_filter_clip = region_filter_clip
