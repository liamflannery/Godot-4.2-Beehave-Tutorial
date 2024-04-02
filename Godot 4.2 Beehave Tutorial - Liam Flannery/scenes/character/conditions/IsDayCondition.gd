extends ConditionLeaf

func tick(_actor, _blackboard):
	if TimeManager.is_day():
		return SUCCESS
	return FAILURE
