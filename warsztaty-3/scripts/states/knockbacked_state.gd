extends State
class_name KnockbackedState

var kb_speed: float = 250
var kb_time: float = 0.15
var kb_direction: Vector2 = Vector2.RIGHT


func enter() -> void:
	var timer := get_tree().create_timer(kb_time)
	timer.timeout.connect(_kb_timer_timeout)


func physics_process(_delta: float) -> void:
	character.velocity = kb_direction * kb_speed


func _kb_timer_timeout():
	state_machine.change_state("IdleState")
