extends Node

var portalId = 1
var max_portals = 2
var portalA_pos : Vector2 = Vector2.ZERO
var portalB_pos : Vector2 = Vector2.ZERO
var portalexist :bool = false
#just some utilities

onready var portalA : Node = get_node("portal A")
onready var portalB : Node = get_node("portal B")
onready var player : Node = get_node("Player")


func _ready() -> void : 
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			Create_portals(event.position) 

func Create_portals(Position: Vector2) -> void: 
	if portalId == 1 :
		portalA_pos = Position
		portalA.set_global_position(Position)
		get_node("portal A").visible = true
		portalId = portalId + 1
		return 
	if portalId == 2 :
		portalB_pos = Position
		portalB.set_global_position(Position)
		get_node("portal B").visible = true
		portalId = portalId + 1
		portalA.connect("bodyEnteredPortal" , player , "teleport", [get_portalB_pos()])
	return 

func get_portalB_pos() -> Vector2:
	return portalB_pos

func does_portal_exist(portal : Node) -> bool : 
	if portal : 
		return true
	return false
