class_name Game extends Node


const character_radius: float = 16
const max_zombies: int = 30


var player: Character
var zombies: Array[Character]

var counter = 0


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	player = Character.new(Vector2(), character_radius, Color.WHITE)
	
	player.update = func(delta: float):
		player.position = get_window().get_mouse_position()
		player.position = player.position.clamp(
			Vector2(player.radius, player.radius),
			Vector2(get_window().size) - Vector2(player.radius, player.radius)
		)
	
	add_child(player)


func spawn_zombie() -> void:
	counter += 1
	
	var randy = randi_range(0, 3)
	
	var spawn_location = Vector2()
	
	if randy == 0:
		spawn_location.y = -character_radius
	elif randy == 1:
		spawn_location.x = -character_radius
	elif randy == 2:
		spawn_location.y = get_window().size.y + character_radius
	elif randy == 3:
		spawn_location.x = get_window().size.x + character_radius
	
	if randy == 0 or randy == 2:
		spawn_location.x = randi_range(0, get_window().size.x + character_radius)
	elif randy == 1 or randy == 3:
		spawn_location.y = randi_range(0, get_window().size.y + character_radius)
	
	spawn_location.x = 100
	spawn_location.y = 100
	
	var zombie = Character.new(
		spawn_location,
		character_radius,
		Color.LIME
	)
	
	zombie.update = func(delta: float):
		if counter == 1: print(zombie.position)
		
		var dir: Vector2 = zombie.position.direction_to(player.position)
		
		zombie.position += dir * delta * 240
		
		if zombie.position.distance_to(player.position) < character_radius:
			game_over()
	
	zombies.push_back(zombie)
	
	if zombies.size() > max_zombies:
		zombies[0].queue_free()
		zombies.pop_front()
	
	add_child(zombie)


func game_over():
	print("game over")
