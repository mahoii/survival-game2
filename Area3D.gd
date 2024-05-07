extends Area3D


# Called when the node enters the scene tree for the first time.
func _on_get_food_area_entered(area):
	if area.is_in_group("apple"):
		area.get_parent().queue_free()
		$PlayerNeeds.eat(100)
