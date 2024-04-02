extends ActionLeaf

func tick(actor, blackboard):
	actor.work()
	return RUNNING
