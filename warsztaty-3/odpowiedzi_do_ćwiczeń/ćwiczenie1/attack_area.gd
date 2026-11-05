extends Area2D
class_name AttackArea


@export_range(1, 10, 1, "suffix:dmg") var damage: int = 1
@export_range(1, 300, 1, "suffix:px/s") var kb_speed: float = 250
@export_range(0.1, 1.0, 0.01, "suffix:s") var kb_time: float = 0.15
@onready var character: StateMachineCharacter = $"../.."
