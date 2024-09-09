extends Node


const button_width = 200
const button_height = 40
const button_padding = 25


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	var save_file = FileAccess.open("user://.save", FileAccess.READ)
	var save_data = save_file.get_as_text().split("\n")
	for i in range(Global.hiscores.size()):
		var score = int(save_data[i])
		Global.hiscores[i] = score
	
	Global.score = 0
	
	$TitleLabel.text = "ZombEscape"
	$TitleLabel.add_theme_font_override("font", Global.font)
	$TitleLabel.add_theme_font_size_override("font_size", Global.font_size(6))
	$TitleLabel.add_theme_color_override("font_color", Color.LIME)
	$TitleLabel.position = Vector2i(
		get_window().size.x / 2 - $TitleLabel.size.x / 2,
		get_window().size.y / 3 - $TitleLabel.size.y / 2
	)
	
	var buttons: Array[Button] = [$EasyButton, $MediumButton, $HardButton]
	
	for i in range(buttons.size()):
		var button = buttons[i]
		
		button.add_theme_font_override("font", Global.font)
		button.add_theme_font_size_override("font_size", Global.font_size(2))
		
		button.size.x = button_width
		button.size.y = button_height
		
		button.position.x = get_window().size.x / 2 - button_width / 2
		button.position.y = get_window().size.y / 2 + \
			(button_height+button_padding) * i


func easy_button_clicked():
	Global.difficulty = 0


func medium_button_clicked():
	Global.difficulty = 1


func hard_button_clicked():
	Global.difficulty = 2


func button_clicked():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
