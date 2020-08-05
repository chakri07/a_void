extends Node

var portalId = 1
var max_portals = 2

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
		portalA.set_global_position(Position)
		get_node("portal A").visible = true
		portalId = portalId + 1
		print(portalA.name)
		portalB.connect("bodyEnteredPortal" , player , "teleport",[portal_exist(portalA),portalA.position])
		return 
	if portalId == 2 :
		portalB.set_global_position(Position)
		get_node("portal B").visible = true
		portalId = portalId + 1
		print(portalB.name)
		portalA.connect("bodyEnteredPortal" , player , "teleport",[portal_exist(portalB),portalB.position])
	return 


func find_paired_portal(name : String) -> Vector2: 
	if name == portalA.name :
		return portalB.position
	if name == portalB.name :
		return portalA.position
	return Vector2.ZERO

func portal_exist(portal : Node2D) -> bool : 
	if portal :
		return true
	return false
