extends Node2D

@onready var bedroom_node: Node2D = $bedroom
@onready var stairs_hallway_node: Node2D = $stairs_hallway
@onready var staircase_node: Node2D = $staircase
@onready var exit_hallway_node: Node2D = $exit_hallway
@onready var kitchen_node: Node2D = $kitchen

func _hide(node: Node2D) -> void:
	node.set_process_mode(Node.PROCESS_MODE_DISABLED)
	node.set_visible(false)

func _show(node: Node2D) -> void:
	node.set_process_mode(Node.PROCESS_MODE_INHERIT)
	node.set_visible(true)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_hide(staircase_node)
	_hide(exit_hallway_node)
	_hide(kitchen_node)

func _on_stairs_hallway_enter_on_stair() -> void:
	_hide(bedroom_node)
	_hide(stairs_hallway_node)
	_show(staircase_node)


func _on_staircase_exit_stair_up() -> void:
	_show(bedroom_node)
	_show(stairs_hallway_node)
	_hide(staircase_node)


func _on_staircase_exit_stair_down() -> void:
	_show(exit_hallway_node)
	_show(kitchen_node)
	_hide(staircase_node)


func _on_bedroom_enter_on_puppet_world() -> void:
	get_tree().change_scene_to_file("res://scenes/puppet_world.tscn")
