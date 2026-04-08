# PlayerController.gd

extends KinematicBody2D

# Variables for player movement
var speed = 200
var jump_force = -400
var gravity = 1000
var velocity = Vector2()

# Combat variables
var health = 100
var damage = 10
var is_alive = true

# Ability usage
var ability_cooldown = 5.0
var ability_ready = true

func _ready():
    # Initialize the player
    pass

func _process(delta):
    # Process the player movement and actions
    if is_alive:
        handle_movement(delta)
        handle_actions()

func handle_movement(delta):
    # Basic movement logic
    var input_vector = Vector2()
    input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    velocity.x = input_vector.x * speed

    # Apply gravity
    velocity.y += gravity * delta

    # Move the character
    velocity = move_and_slide(velocity, Vector2.UP)

func handle_actions():
    # Combat actions
    if Input.is_action_just_pressed("attack"):
        attack_enemy()
    
    # Ability usage
    if Input.is_action_just_pressed("use_ability") and ability_ready:
        use_ability()

func attack_enemy():
    # Attack logic
    print("Attacking enemy for", damage, "damage!")

    # Simulate damage to enemy
    # ... add enemy health reduction logic here

func use_ability():
    # Using an ability
    print("Using ability!")
    ability_ready = false
    # Ability cooldown logic
    yield(get_tree().create_timer(ability_cooldown), "timeout")
    ability_ready = true

func take_damage(amount):
    # Damage handling
    health -= amount
    if health <= 0:
        die()

func die():
    # Handle death
    is_alive = false
    print("Player has died!")
