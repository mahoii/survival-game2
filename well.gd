extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_area_entered(area):
	if area.is_in_group("player"):
		$Sprite3D.visible = true
	pass



func _on_area_3d_area_exited(area):
	if area.is_in_group("player"):
		$Sprite3D.visible = false
	pass
