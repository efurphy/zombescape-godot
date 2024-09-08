class_name Character extends Node2D


var radius: float
var color: Color
var update: Callable = func(): pass


func _init(
	position: Vector2,
	radius: float,
	color: Color
) -> void:
	self.position = position
	self.radius = radius
	self.color = color


func _process(delta: float) -> void:
	update.call(delta)


func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)
