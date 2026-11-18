extends CharacterBody2D
class_name EnemyBody2D


@export_range(1, 300, 1, "suffix:px/s") var speed: float = 70
@export_range(1, 3000, 1, "suffix:px/s^2") var acceleration: float = 1700
@export_range(1, 3000, 1, "suffix:px/s^2") var deceleration: float = 1800

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: PlayerBody2D = Globals.player
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

var direction: Vector2


func _physics_process(delta: float) -> void:
	set_direction()
	move(delta)


func set_direction() -> void:
	nav_agent.target_position = player.global_position
	
	if nav_agent.distance_to_target() < 150 and !nav_agent.is_navigation_finished() :
		direction = (nav_agent.get_next_path_position() - global_position).normalized()
	else:
		direction = Vector2.ZERO


func move(delta: float) -> void:
	if direction:
		nav_agent.velocity = velocity.move_toward(direction * speed, acceleration * delta)
		sprite.animation = "run"
		
		if direction.x:
			sprite.flip_h = direction.x < 0.0
	else:
		nav_agent.velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
		sprite.animation = "idle"


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()
