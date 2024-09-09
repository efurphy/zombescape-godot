extends Node2D


const game_over_string: String = "Game Over"
const click_anywhere_string: String = "Click anywhere to continue"
const new_hiscore_text: String = "New record!"

var you_survived_string: String = ""
var hiscore_text: String = ""

var shaking = true
var shake_intensity = 6


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	you_survived_string = "You survived " + str(Global.score) + " seconds"
	hiscore_text = "Hiscore: " + str(Global.hiscores[Global.difficulty])


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_file("res://scenes/Title.tscn")
	
	if shaking:
		position.x = randi_range(-shake_intensity, shake_intensity)
		position.y = randi_range(-shake_intensity, shake_intensity)


func _draw() -> void:
	draw_string(
		Global.font,
		Vector2i(
			get_window().size.x / 2,
			get_window().size.y / 2.5
		) - Vector2i(Global.font.get_string_size(
			game_over_string, HORIZONTAL_ALIGNMENT_CENTER, -1, 40
		) / 2),
		game_over_string,
		HORIZONTAL_ALIGNMENT_CENTER,
		-1,
		40,
		Color.RED
	)
	
	draw_string(
		Global.font,
		Vector2i(
			get_window().size.x / 2,
			get_window().size.y / 2
		) - Vector2i(Global.font.get_string_size(
			you_survived_string, HORIZONTAL_ALIGNMENT_CENTER, -1, 24
		) / 2),
		you_survived_string,
		HORIZONTAL_ALIGNMENT_CENTER,
		-1,
		24,
		Color.WHITE
	)
	
	draw_string(
		Global.font,
		Vector2i(
			get_window().size.x / 2,
			get_window().size.y / 2 + 80
		) - Vector2i(Global.font.get_string_size(
			hiscore_text, HORIZONTAL_ALIGNMENT_CENTER, -1, 16
		) / 2),
		hiscore_text,
		HORIZONTAL_ALIGNMENT_CENTER,
		-1,
		16,
		Color.WHITE
	)
	
	if Global.new_hiscore:
		draw_string(
			Global.font,
			Vector2i(
				get_window().size.x / 2,
				get_window().size.y / 2 + 100
			) - Vector2i(Global.font.get_string_size(
				new_hiscore_text, HORIZONTAL_ALIGNMENT_CENTER, -1, 16
			) / 2),
			new_hiscore_text,
			HORIZONTAL_ALIGNMENT_CENTER,
			-1,
			16,
			Color.GOLD
		)
	
	draw_string(
		Global.font,
		Vector2i(
			get_window().size.x / 2,
			get_window().size.y - 80
		) - Vector2i(Global.font.get_string_size(
			click_anywhere_string, HORIZONTAL_ALIGNMENT_CENTER, -1, 16
		) / 2),
		click_anywhere_string,
		HORIZONTAL_ALIGNMENT_CENTER,
		-1,
		16,
		Color.WHITE
	)


func stop_shaking():
	position = Vector2.ZERO
	shaking = false
