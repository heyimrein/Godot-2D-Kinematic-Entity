extends KinematicBody2D

# Do not create an 'Entity' node. 
# Instead, inherit the 'Entity' class and override the methods defined below to add custom behavior.
class_name Entity

export(int, "Collide", "Slide") var move_type := 0
export var health := 3

var velocity := Vector2.ZERO
var collision:KinematicCollision2D
var up_direction := Vector2.UP


func _physics_process(delta):
	move(delta)
	animate(delta)
	
	match move_type:
		0:
			collision = move_and_collide(velocity * delta)
		1:
			move_and_slide(velocity, up_direction)


# Override to move your entity.
# Directly modify the 'velocity' variable to do so.
func move(delta:float) -> void:
	pass


# Override to animate your entity.
func animate(delta:float) -> void:
	pass


# Override to create custom behavior upon taking damage.
func take_damage() -> void:
	if health > 1:
		health -= 1
	else:
		die()


# Override to create custom death behavior. (This is how you skip 'freeing' the object.)
func die() -> void:
	queue_free()
