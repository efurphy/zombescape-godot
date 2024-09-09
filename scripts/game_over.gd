extends Node


var shaking = true
var shake_intensity = 6


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	$GameOverLabel.text = "Game Over"
	$GameOverLabel.add_theme_font_override("font", Global.font)
	$GameOverLabel.add_theme_font_size_override("font_size", Global.font_size(6))
	$GameOverLabel.add_theme_color_override("font_color", Color.RED)
	$GameOverLabel.position = Vector2i(
		get_window().size.x / 2 - $GameOverLabel.size.x / 2,
		get_window().size.y / 3 - $GameOverLabel.size.y / 2
	)
	
	$YouSurvivedLabel.text = "You survived " + str(Global.score) + " seconds"
	$YouSurvivedLabel.add_theme_font_override("font", Global.font)
	$YouSurvivedLabel.add_theme_font_size_override("font_size", Global.font_size(3))
	$YouSurvivedLabel.add_theme_color_override("font_color", Color.WHITE)
	$YouSurvivedLabel.position = Vector2i(
		get_window().size.x / 2 - $YouSurvivedLabel.size.x / 2,
		get_window().size.y / 2 - $YouSurvivedLabel.size.y / 2
	)
	
	$HiscoreLabel.text = "Hiscore: " + str(Global.hiscores[Global.difficulty])
	$HiscoreLabel.add_theme_font_override("font", Global.font)
	$HiscoreLabel.add_theme_font_size_override("font_size", Global.font_size(2))
	$HiscoreLabel.add_theme_color_override("font_color", Color.WHITE)
	$HiscoreLabel.position = Vector2i(
		get_window().size.x / 2 - $HiscoreLabel.size.x / 2,
		get_window().size.y / 2 - $HiscoreLabel.size.y / 2 + 80
	)
	
	$NewHiscoreLabel.text = "New record!"
	$NewHiscoreLabel.add_theme_font_override("font", Global.font)
	$NewHiscoreLabel.add_theme_font_size_override("font_size", Global.font_size(2))
	$NewHiscoreLabel.add_theme_color_override("font_color", Color.GOLD)
	$NewHiscoreLabel.position = Vector2i(
		get_window().size.x / 2 - $NewHiscoreLabel.size.x / 2,
		get_window().size.y / 2 - $NewHiscoreLabel.size.y / 2 + 110
	)
	if not Global.new_hiscore:
		$NewHiscoreLabel.visible = false
	
	$ClickAnywhereLabel.text = "Click anywhere to continue"
	$ClickAnywhereLabel.add_theme_font_override("font", Global.font)
	$ClickAnywhereLabel.add_theme_font_size_override("font_size", Global.font_size(2))
	$ClickAnywhereLabel.add_theme_color_override("font_color", Color.WHITE)
	$ClickAnywhereLabel.position = Vector2i(
		get_window().size.x / 2 - $ClickAnywhereLabel.size.x / 2,
		get_window().size.y - $ClickAnywhereLabel.size.y / 2 - 80
	)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_file("res://scenes/Title.tscn")
	
	if shaking:
		$Camera2D.position.x = randi_range(-shake_intensity, shake_intensity)
		$Camera2D.position.y = randi_range(-shake_intensity, shake_intensity)


func stop_shaking():
	$Camera2D.position = Vector2.ZERO
	shaking = false
