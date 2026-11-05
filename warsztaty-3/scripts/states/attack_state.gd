extends State
class_name AttackState


@export var attack_collision: CollisionShape2D
@export var attack_sprite: AnimatedSprite2D
@export var attack_animation: String = "attack"


func _ready() -> void:
	attack_sprite.animation_finished.connect(attack_animation_finished)


func enter() -> void:
	super()
	
	character.pivot.rotation = character.last_direction.angle()
	character.velocity = Vector2.ZERO
	attack_collision.disabled = false
	attack_sprite.visible = true
	attack_sprite.play(attack_animation)


func attack_animation_finished():
	attack_collision.disabled = true
	attack_sprite.visible = false
	state_machine.change_state("IdleState")
