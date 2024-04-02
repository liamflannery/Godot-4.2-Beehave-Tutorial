# IsAtHomeCondition.gd
extends ConditionLeaf

func tick(actor, _blackboard):
 if actor.is_at_home():
  return SUCCESS
 else: 
  return FAILURE
