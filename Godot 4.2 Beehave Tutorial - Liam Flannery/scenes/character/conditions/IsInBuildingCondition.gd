# IsInBuilding.gd
extends ConditionLeaf

func tick(actor, _blackboard):
	if actor.in_building():
		return SUCCESS
	return FAILURE
