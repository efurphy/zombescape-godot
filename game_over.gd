extends Node2D


const game_over_string: String = "Game Over"
const click_anywhere_string: String = "Click anywhere to continue"

var you_survived_string: String = ""



func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_file("res://Title.tscn")


func _draw() -> void:
	draw_string(
		Global.font,
		Vector2(
			get_window().size.x / 2,
			get_window().size.y / 2.5
		) - Global.font.get_string_size(
			game_over_string, HORIZONTAL_ALIGNMENT_CENTER, -1, 40
		) / 2,
		game_over_string,
		HORIZONTAL_ALIGNMENT_CENTER,
		-1,
		40,
		Color.RED
	)
