extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	get_parent().get_node("Timer/Timer").connect("timeout", self, "on_timer_out")
	$Panel/Reintentar.connect("pressed",self,"on_reiniciar_pressed")
	$Panel/Salir.connect("pressed",self,"on_salir_pressed")


func on_timer_out():
	visible = true
	get_tree().paused = true
	$GameOverSound.play()


func on_reiniciar_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	#$ReintentarSound.play()


func on_salir_pressed():
	#get_tree(escena de menu)
	pass
