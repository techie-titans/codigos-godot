# Um objeto SpawnBullets foi criado no lugar onde as balas devem ser criadas.
# Este objeto é somente um Position2D filho do braço ou do personagem.

const BULLET_SPEED = 5
var bullet = preload("res://scenes/Bullet.tscn")

# func _physics_process(delta):

func shoot():
	var clone_bullet = bullet.instance()
	# var bullet_angle = get_angle_to(get_global_mouse_position()) + $Arm/SpawnBullets.get_rotation()
	# clone_bullet.set_rotation(bullet_angle)
	clone_bullet.rotation = $Arm.rotation
	clone_bullet.position = $Arm/SpawnBullets.get_global_position()
	get_parent().add_child(clone_bullet)
	var direction = get_global_mouse_position() - get_global_position()
	clone_bullet.apply_impulse(Vector2(), direction * BULLET_SPEED)
