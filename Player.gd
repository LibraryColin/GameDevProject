extends CharacterBody2D

# Character Speed is 100
var speed = 100.0

# load the ball scene
@onready var ball = preload("res://ball.tscn")

# Actions and moving
func _physics_process(delta):
	if Input.is_action_just_pressed("down"):
		velocity.y += speed
	if Input.is_action_just_pressed("up"):
		velocity.y -= speed
	if Input.is_action_just_pressed("left"):
		velocity.x -= speed
	if Input.is_action_just_pressed("right"):
		velocity.x += speed
	if Input.is_action_just_pressed("click"):
		create_ball()
	
	move_and_slide()

# Create the ball at player location
func create_ball():
	var bp = ball.instantiate()
	get_parent().add_child(bp)
	bp.position = position
