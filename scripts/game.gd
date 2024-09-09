class_name Game extends Node


const character_radius: float = 16
const max_zombies: int = 30


var player: Character
var zombies: Array[Character]


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
	Global.new_hiscore = false
	
	$ScoreLabel.position.y = 8
	update_score_label()
	
	$SpawnZombieTimer.wait_time = Global.spawn_times[Global.difficulty]
	
	player = Character.new(Vector2(), character_radius, Color.WHITE)
	
	player.z_index = 1
	
	player.update = func(delta: float):
		player.position = get_viewport().get_mouse_position()
		player.position = player.position.clamp(
			Vector2(player.radius, player.radius),
			Vector2(get_window().size) - Vector2(player.radius, player.radius)
		)
	
	player.update.call(0)
	
	add_child(player)


func spawn_zombie() -> void:
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
		spawn_location.x = randi_range(0,
			get_window().size.x + character_radius)
	elif randy == 1 or randy == 3:
		spawn_location.y = randi_range(0,
			get_window().size.y + character_radius)
	
	var zombie = Character.new(
		spawn_location,
		character_radius,
		Color.LIME
	)
	
	zombie.update = func(delta: float):
		var dir: Vector2 = zombie.position.direction_to(player.position)
		
		zombie.position += dir * delta * 240
		
		if zombie.position.distance_to(player.position) \
			< zombie.radius + player.radius:
			game_over()
	
	zombies.push_back(zombie)
	
	if zombies.size() > max_zombies:
		zombies[0].queue_free()
		zombies.pop_front()
	
	add_child(zombie)


func game_over():
	if Global.score > Global.hiscores[Global.difficulty]:
		Global.hiscores[Global.difficulty] = Global.score
		Global.new_hiscore = true
		
		# save game
		var save_game = FileAccess.open("user://.save", FileAccess.WRITE)
		
		for i in Global.hiscores:
			save_game.store_line(str(i))
		
		save_game.close()
	
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")


func increment_score():
	Global.score += 1
	update_score_label()


func update_score_label():
	$ScoreLabel.text = str(Global.score)
