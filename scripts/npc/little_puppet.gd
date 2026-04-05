extends Node2D

signal enter_on_puppet()
var is_on_puppet = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && is_on_puppet==true:
		emit_signal("enter_on_puppet")

func _on_puppet_collision_body_entered(body: Node2D) -> void:
	if body.name=="main_char":
		body.get_node("FloatingE").set_visible(true)
		is_on_puppet=true


func _on_puppet_collision_body_exited(body: Node2D) -> void:
	if body.name=="main_char":
		body.get_node("FloatingE").set_visible(false)
		is_on_puppet=false
