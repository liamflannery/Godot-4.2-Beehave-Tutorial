extends ActionLeaf

func tick(actor, blackboard):
	actor.sleep()
	return RUNNING
