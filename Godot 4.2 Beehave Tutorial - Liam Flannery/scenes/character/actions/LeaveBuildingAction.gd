# LeaveBuildingAction.gd
extends ActionLeaf

func tick(actor, _blackboard):
	actor.exit_building()
	return SUCCESS
