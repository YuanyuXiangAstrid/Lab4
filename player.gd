extends CharacterBody3D

const SPEED := 6.0
const JUMP_VELOCITY := 4.5
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	# 重力
	if not is_on_floor():
		velocity.y -= gravity * delta

	var dir := Vector3.ZERO

	# 直接用键盘 WASD 控制
	if Input.is_key_pressed(KEY_W):
		dir.z -= 1
	if Input.is_key_pressed(KEY_S):
		dir.z += 1
	if Input.is_key_pressed(KEY_A):
		dir.x -= 1
	if Input.is_key_pressed(KEY_D):
		dir.x += 1

	dir = dir.normalized()

	velocity.x = dir.x * SPEED
	velocity.z = dir.z * SPEED

	# 空格跳跃
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
