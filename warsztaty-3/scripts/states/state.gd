extends Node
class_name State


@export var animation: String = "animation_name"

var state_machine: StateMachine
var character: StateMachineCharacter


func enter() -> void:
	if animation:
		character.sprite.play(animation)


func input(_event: InputEvent) -> void:
	pass


func process(_delta: float) -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


func exit() -> void:
	pass
