extends Node2D

#signals and variables 
signal bodyEnteredPortal

func _on_Portal_Area_2D_entered(body: Node) -> void:
	emit_signal("bodyEnteredPortal")
