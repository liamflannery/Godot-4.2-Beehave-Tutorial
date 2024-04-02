extends Node2D

@export var current_building : Building
@export var home : Building
@export var work_location : Building
@export var sleep_icon : Sprite2D
@export var work_icon : Sprite2D

func _ready():
	sleep_icon.hide()
	work_icon.hide()
	sleep_icon.visibility_changed.connect(_cooldown_icons)
	work_icon.visibility_changed.connect(_cooldown_icons)
	if current_building:
		enter_building(current_building)


func enter_building(building : Building):
		global_position = building.global_position # move to building
		hide() 
		current_building = building
	
func exit_building():
	if !current_building: # can't exit a building if not in one
		print("attempting to exit when not in building")
		return
	current_building = null
	show()

func in_range(building_position : Vector2) -> bool:
	return building_position.distance_to(position) < 1

func is_at_home():
	return current_building == home
func is_at_work():
	return current_building == work_location
	
func in_building():
	return current_building != null

func sleep():
	sleep_icon.position = Vector2(position.x - 50, position.y - 100)
	if !sleep_icon.visible:
		await get_tree().create_timer(1).timeout
		sleep_icon.show()

func work():
	work_icon.position = Vector2(position.x - 50, position.y - 100)
	if !work_icon.visible:
		await get_tree().create_timer(1).timeout
		work_icon.show()

func _cooldown_icons():
	await get_tree().create_timer(1).timeout
	work_icon.visible = false if work_icon.visible else work_icon.visible
	sleep_icon.visible = false if sleep_icon.visible else sleep_icon.visible

func get_work() -> Building:
	return work_location
func get_home() -> Building:
	return home
func get_current_building() -> Building:
	return current_building
