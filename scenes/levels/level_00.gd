extends Node2D

@export var ground_speed: float = 500
@export var grounds: Array

var ground_active_dict: Dictionary
var ground_count = 0
var random_ground
var ground

func _ready():
	randomize()
	pick_random_ground("null")

func _process(delta):
	for g in ground_active_dict:
		if ground_active_dict[g]:
			move_random_ground(g, delta)

func pick_random_ground(current_ground):
	random_ground = grounds[randi() % grounds.size()]
	ground = get_node(random_ground)

	if str(ground) == str(current_ground):
		pick_random_ground(current_ground)
		print("ignoring: ", ground)

	ground.position = Vector2(3000, 500)
	ground_active_dict[ground] = true
	print("picked ground: ", ground)

func move_random_ground(some_ground, delta):
	some_ground.position.x -= ground_speed * delta

func _on_spawn_ground_area_area_entered(area):
	if area.name.contains("Ground"):
		pick_random_ground(area)

func _on_disable_area_area_entered(area):
	# ground_active_dict[area] = false
	ground_active_dict.erase(area)
