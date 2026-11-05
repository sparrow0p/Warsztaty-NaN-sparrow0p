extends CharacterBody2D
class_name StateMachineCharacter


@export var state_machine: StateMachine
@export var sprite: AnimatedSprite2D
@export var pivot: Node2D
@export var last_direction: Vector2 = Vector2.RIGHT
@export var health: int = 5

var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	state_machine.setup_state_machine(self)


func _on_hit(area: Area2D) -> void:
	if area is AttackArea:
		health -= area.damage
		
		if health <= 0:
			state_machine.change_state("DeadState")
			return
		
		var kb_state: KnockbackedState = state_machine.states["KnockbackedState"]
		kb_state.kb_direction = (global_position - area.character.global_position).normalized()
		kb_state.kb_speed = area.kb_speed
		kb_state.kb_time = area.kb_time
		state_machine.change_state("KnockbackedState")
