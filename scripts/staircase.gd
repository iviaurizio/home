extends Node2D

var on_exit_up = false
var on_exit_down = false

signal exit_stair_up()
signal exit_stair_down()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && on_exit_up:
		emit_signal("exit_stair_up")
		
	if Input.is_action_just_pressed("Interact") && on_exit_down:
		emit_signal("exit_stair_down")


func _on_exit_stair_up_body_entered(body: Node2D) -> void:
	if body.name=="main_char":
		body.get_node("FloatingE").set_visible(true)
		on_exit_up=true


func _on_exit_stair_up_body_exited(body: Node2D) -> void:
	if body.name=="main_char":
		body.get_node("FloatingE").set_visible(false)
		on_exit_up=false


func _on_exit_stair_down_body_entered(body: Node2D) -> void:
	if body.name=="main_char":
		body.get_node("FloatingE").set_visible(true)
		on_exit_down=true


func _on_exit_stair_down_body_exited(body: Node2D) -> void:
	if body.name=="main_char":
		body.get_node("FloatingE").set_visible(false)
		on_exit_down=false
