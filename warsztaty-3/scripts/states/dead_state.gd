extends State
class_name DeadState


func enter() -> void:
	character.velocity = Vector2.ZERO
	character.sprite.play("dead")
