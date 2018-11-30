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
		# Inverter o eixo caso seja um sprite simples ou pré animado
		$Sprite.flip_h = false
		# Utilizar este outro método de inversão caso seja um sprite com várias partes montadas em uma animação estilo cutout
		$Sprite.set_scale(Vector2(1,1))
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		# Inverter o eixo caso seja um sprite simples ou pré animado
		$Sprite.flip_h = true
		# Utilizar este outro método de inversão caso seja um sprite com várias partes montadas em uma animação estilo cutout
		$Sprite.set_scale(Vector2(-1,1))
		$Sprite.play("run")
	else:
		motion.x = 0
		$Sprite.play("idle")
	
	# Jump
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		motion.y = -JUMP
	else:
		$Sprite.play("jump")
	
	motion = move_and_slide(motion, UP)
