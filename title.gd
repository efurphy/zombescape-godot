extends Node2D


const title_string = "ZombEscape"
const button_width = 200
const button_height = 40
const button_padding = 25


var buttons: Array[Button] = [$EasyButton, $MediumButton, $HardButton]


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	Global.score = 0
	
	$EasyButton.size.x = button_width
	$MediumButton.size.x = button_width
	$HardButton.size.x = button_width
	
	$EasyButton.size.y = button_height
	$MediumButton.size.y = button_height
	$HardButton.size.y = button_height
	
	$EasyButton.position.x = get_window().size.x / 2 - button_width / 2
	$MediumButton.position.x = get_window().size.x / 2 - button_width / 2
	$HardButton.position.x = get_window().size.x / 2 - button_width / 2
	
	$EasyButton.position.y = get_window().size.y / 2
	$MediumButton.position.y = get_window().size.y / 2 + (button_height+button_padding)
	$HardButton.position.y = get_window().size.y / 2 + (button_height+button_padding)*2


func _draw() -> void:
	draw_string(
		Global.font,
		Vector2(
			get_window().size.x / 2,
			get_window().size.y / 2.5
		) - Global.font.get_string_size(
			title_string, HORIZONTAL_ALIGNMENT_CENTER, -1, 40
		) / 2,
		title_string,
		HORIZONTAL_ALIGNMENT_CENTER,
		-1,
		40,
		Color.LIME
	)


func easy_button_clicked():
	Global.difficulty = 0


func medium_button_clicked():
	Global.difficulty = 1


func hard_button_clicked():
	Global.difficulty = 2


func button_clicked():
	get_tree().change_scene_to_file("res://Game.tscn")
