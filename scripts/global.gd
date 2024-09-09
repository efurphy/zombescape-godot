class_name Global extends Node


static func font_size(multiplier: int):
	return 7 * multiplier # 7 is the line height of the furphySmall font


static var font: Font = preload("res://assets/fonts/furphySmall.ttf")

static var difficulty: int = 0
static var spawn_times: Array[float] = [1, 0.5, 0.25]

static var score: int = 0

static var hiscores: Array[int] = [0, 0, 0]
static var new_hiscore: bool = false
