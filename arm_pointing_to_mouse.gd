var localMousePosition
var globalMousePosition

func _physics_process(delta):
	
	# Get local and global mouse positions
	localMousePosition  = get_local_mouse_position()
	globalMousePosition = get_global_mouse_position()
	
	# Fazer o braço apontar para o mouse
  	$Arm.rotation = localMousePosition.angle()

	# Correção quando o mouse está pra tras do braço
	
