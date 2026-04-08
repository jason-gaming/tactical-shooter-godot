extends Node3D

var lighting
var weather_system

func _ready():
    lighting = $DirectionalLight3D
    setup_environment()

func setup_environment():
    if lighting:
        lighting.light_energy = 1.0
        lighting.rotation.x = -PI/4

func change_time_of_day(time_value: float):
    if lighting:
        lighting.rotation.x = -PI/2 + (time_value * PI)