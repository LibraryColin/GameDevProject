extends CharacterBody2D

# Ball Speed
var speed = 900.0

# Mouse Location
var mlocation = Vector2.ZERO

# Get the mouse location on start
func _ready():
	mlocation = get_global_mouse_position()

# Move towards the mouselocation every step
func _physics_process(delta):
	var direction = global_position.direction_to(mlocation)
	velocity = direction * speed
	move_and_slide()

#Delete the ball on time out
func _on_timer_timeout():
	queue_free()

# If hit wall, delete it
func _on_hitbox_body_entered(body):
	if body.is_in_group("wall"):
		body.queue_free()
