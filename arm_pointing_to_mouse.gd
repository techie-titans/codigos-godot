func _physics_process(delta):
	
	# Fazer o braço apontar para o mouse
	$Arm.rotation = get_local_mouse_position().angle()
	
	# Checar se o player esta olhando pra esquerda ou direita
	if position.x < get_global_mouse_position().x:
		lookRight = 1
	else:
		lookRight = 0
		
	# Flip nos sprites quando o personagem vira
	if lookRight:
		$Sprite.set_scale(Vector2(1, 1))
		$Arm.set_scale(Vector2(1.5, 0.5))
	else:
		$Sprite.set_scale(Vector2(-1, 1))
		$Arm.set_scale(Vector2(1.5, -0.5))
