extends Node2D

export var x_vel = 25

func _physics_process(delta: float) -> void:
	var vel : Vector2 = Vector2(x_vel,0)
	vel = get_node("playerKinematic").move_and_slide(vel,Vector2.UP) 
	return

func teleport(portal_exist : bool ,portal_pos: Vector2) -> void : 
	if portal_exist : 
		set_global_position(portal_pos)
