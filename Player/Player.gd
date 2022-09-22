extends KinematicBody2D

var velocity = Vector2.ZERO

var rotation_speed = 4
var move_speed = 2
var brakes = 1
var max_speed = 8
func _ready():
	pass 
	
func _physics_process(_delta):
	$Exaust.hide()
	position = position + velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_speed)
	if Input.is_action_pressed("forward"):
		velocity = velocity + Vector2(0,-move_speed).rotated(rotation)
		$Exaust.show()
	if Input.is_action_pressed("left"):
		rotation_degrees = rotation_degrees - rotation_speed
	if Input.is_action_pressed("right"):
		rotation_degrees = rotation_degrees + rotation_speed
	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)
