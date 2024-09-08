class_name Character extends Node2D


var radius: float
var color: Color
var update: Callable


func _init(
	position: Vector2,
	radius: float,
	color: Color,
	update: Callable = func(delta: float):pass
) -> void:
	self.position = position
	self.radius = radius
	self.color = color
	self.update = update


func _process(delta: float) -> void:
	update.call(delta)


func _draw() -> void:
	draw_circle(position, radius, color)
