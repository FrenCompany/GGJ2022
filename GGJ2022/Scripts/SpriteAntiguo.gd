extends Node2D


export(Texture) var texture 
export(bool) var region_enabled = false
export(Rect2) var region_rect
export(bool) var region_filter_clip = false


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self)
	$SpriteWorld.texture = self.texture
	$SpriteWorld.region_enabled = self.region_enabled
	$SpriteWorld.region_rect = self.region_rect
	$SpriteWorld.region_filter_clip = self.region_filter_clip
