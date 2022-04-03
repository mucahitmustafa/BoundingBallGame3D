extends RigidBody

export var rolling_force = 40
export var jump_impulse = 100

func _ready():
	$CameraRig.set_as_toplevel(true)
	$FloorCheck.set_as_toplevel(true)
	
func _physics_process(delta):
	var old_camera_position = $CameraRig.global_transform.origin
	var ball_position = global_transform.origin
	var new_camera_position = lerp(old_camera_position, ball_position, 0.1)
	$CameraRig.global_transform.origin = new_camera_position
	
	$FloorCheck.global_transform.origin = global_transform.origin
	
	if Input.is_action_pressed("forward"):
		angular_velocity.x -= rolling_force * delta
	elif Input.is_action_pressed("back"):
		angular_velocity.x += rolling_force * delta
	if Input.is_action_pressed("right"):
		angular_velocity.z -= rolling_force * delta
	elif Input.is_action_pressed("left"):
		angular_velocity.z += rolling_force * delta

	var is_on_floor = $FloorCheck.is_colliding()
	if Input.is_action_pressed("jump") and is_on_floor:
		apply_central_impulse(Vector3.UP * jump_impulse)
		
		
		
