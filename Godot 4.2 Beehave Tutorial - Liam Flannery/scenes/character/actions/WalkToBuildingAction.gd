#WalkToBuildingAction.gd
extends ActionLeaf
enum TARGET {HOME, WORK}
@export var walk_to : TARGET
func tick(actor, blackboard):
	var target_building : Building
	if walk_to == TARGET.HOME:
		target_building = actor.get_home()
	if walk_to == TARGET.WORK:
		target_building = actor.get_work()
		
	if actor.in_range(target_building.position):
		blackboard.set_value("target_building", target_building)
		return SUCCESS
	actor.position.x = move_toward(actor.position.x, target_building.position.x, 5)
	return RUNNING
