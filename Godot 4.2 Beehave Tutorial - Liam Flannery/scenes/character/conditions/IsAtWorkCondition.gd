# IsAtWorkCondition.gd
extends ConditionLeaf

func tick(actor, _blackboard):
 if actor.is_at_work():
  return SUCCESS
 else: 
  return FAILURE
