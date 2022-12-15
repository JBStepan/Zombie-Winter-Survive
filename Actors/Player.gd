extends KinematicBody2D

## Exported Vars ##
export var move_speed: float=150.0

## Variables ##
export onready var player_stats := $Stats

func _ready() -> void:
	set_as_toplevel(true)

func _physics_process(_delta: float) -> void:
	var movement_direction := Vector2.ZERO;
	
	if Input.is_action_pressed("up"):
		movement_direction.y = -1;
	if Input.is_action_pressed("down"):
		movement_direction.y = 1;
	if Input.is_action_pressed("left"):
		movement_direction.x = -1
	if Input.is_action_pressed("right"):
		movement_direction.x = 1
		
	movement_direction = movement_direction.normalized();
	move_and_slide(movement_direction * move_speed, Vector2.DOWN);
	
	look_at(get_global_mouse_position())
