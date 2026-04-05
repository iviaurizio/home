extends CharacterBody2D

var direction

@export_range(0, 2000) var SPEED: float = 200.0
@export_range(0, 10000) var GRAVITY: float = 400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity.y += _delta*GRAVITY
	
	direction = Input.get_axis("ui_left", "ui_right")
	
	if direction>0:
		$AnimatedSprite2D.flip_h = false
	if direction<0:
		$AnimatedSprite2D.flip_h = true
	
	if direction==0:
		$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		direction = direction/abs(direction)
		$AnimatedSprite2D.play("walk")
		velocity.x = direction * SPEED
	
	move_and_slide()
