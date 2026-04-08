extends CharacterBody3D

const SPEED = 2.5
var health = 50
var player_ref

func _ready():
    player_ref = get_tree().get_nodes_in_group("player")[0]

func _process(delta):
    if player_ref:
        var direction = (player_ref.global_position - global_position).normalized()
        velocity = direction * SPEED
        move_and_slide()

func take_damage(damage):
    health -= damage
    if health <= 0:
        die()

func die():
    queue_free()