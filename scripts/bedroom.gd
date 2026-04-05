extends Node2D

signal enter_on_puppet_world()

func _on_little_puppet_enter_on_puppet() -> void:
	emit_signal("enter_on_puppet_world")
