# Corrected Godot 4 Syntax for Player Controller

# Replace yield with await and update move_and_slide

extends CharacterBody2D

# Declare member variables here. Examples:
var speed = 400
var jump_speed = -800

func _physics_process(delta):
    # Use await instead of yield
    await get_tree().create_timer(1.0).timeout

    var velocity = Vector2.ZERO

    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1

    # Call move_and_slide with only one parameter
    move_and_slide(velocity)
