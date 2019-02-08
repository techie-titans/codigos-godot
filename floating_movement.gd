# Script que faz um inimigo 'voar' de forma natural e bonita
# de um limite até outro da borda da tela.

extends KinematicBody2D

const V_SPEED = 5
const H_SPEED = 3
const UP_LIMIT = 100
const MAX_SPEED = 100
const BORDER_LIMIT = 100
var screensize
var direction = -1
var chave = false
var motion = Vector2()

func _ready():
	screensize = get_viewport_rect().size

func _physics_process(delta):
	# Checa a direção que ele deve ir
	directionsController()
	
	# Up/Down movement
	if position.y > UP_LIMIT:
		motion.y -= V_SPEED/2
	else:
		motion.y += V_SPEED/2
	
	# Left/Rigth movement
	if direction == 1: # Rigth
		motion.x -= H_SPEED
		$Sprite.set_flip_h(true)
	elif direction == -1: # Left
		motion.x += H_SPEED
		$Sprite.set_flip_h(false)
	
	# Limitar a velocidade
	motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
	
	motion = move_and_slide(motion)
	
func directionsController():
	# Altera a direção dele caso atinja os limites estipulados
	if position.x > BORDER_LIMIT and chave == false:
		direction = 1
	elif position.x < (screensize.x - BORDER_LIMIT):
		direction = -1
		chave = true
	
	if position.x > (screensize.x - BORDER_LIMIT):
		chave = false
