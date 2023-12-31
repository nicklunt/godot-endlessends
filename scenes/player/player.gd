extends RigidBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -1000.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Don't move on the x axis
	# velocity.x = 0

	# Add the gravity.
	# if not is_on_floor():
	#	velocity.y += gravity * delta

	if position.y > 443:
		position.y = 443

	# Handle Jump.
	# if Input.is_action_just_pressed("jump") and is_on_floor():
	if Input.is_action_just_pressed("jump") and position.y >= 442:
		linear_velocity = Vector2(0, JUMP_VELOCITY)
		# velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

	# move_and_slide()
