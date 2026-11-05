extends StateMachineCharacter


@export var player: Player

@onready var hit_area: Area2D = $HitArea


func _physics_process(_delta: float) -> void:
	var distance: float = global_position.distance_to(player.global_position)
	
	if distance < 150 and distance > 20:
		direction = (player.global_position - global_position).normalized()
		last_direction = direction
	else:
		direction = Vector2.ZERO


func _on_attack_timer_timeout() -> void:
	state_machine.change_state("AttackState")
