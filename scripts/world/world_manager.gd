extends Node3D

var enemy_spawner

func _ready():
    enemy_spawner = $EnemySpawner
    add_to_group("world")

func _process(delta):
    check_game_conditions()

func check_game_conditions():
    var enemies = get_tree().get_nodes_in_group("enemies")
    if enemies.size() == 0:
        end_wave()

func end_wave():
    print("Wave completed!")
    yield(get_tree(), "idle_frame")
    enemy_spawner.spawn_interval *= 0.9