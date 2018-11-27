extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 12
const SPEED = 200
const JUMP = 300
var motion = Vector2()

func _physics_process(delta):
	# Gravity
	motion.y += GRAVITY

	# Movement
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false;
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true;
	else:
		motion.x = 0
	
	# Jump
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		motion.y = -JUMP
	
	motion = move_and_slide(motion, UP)
