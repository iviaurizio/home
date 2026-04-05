extends Node2D

var on_stair = false

signal enter_on_stair()

@onready var area: Area2D = $StairTrigger

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if on_stair and Input.is_action_just_pressed("Interact"):
		emit_signal("enter_on_stair")

func _on_stair_trigger_body_entered(body: Node2D) -> void:
	if body.name == "main_char":
		body.get_node("FloatingE").set_visible(true)
		on_stair = true


func _on_stair_trigger_body_exited(body: Node2D) -> void:
	if body.name == "main_char":
		body.get_node("FloatingE").set_visible(false)
		on_stair = false
