extends Node
signal day_set(is_day)
var day := true

func set_night():
	day = false
	day_set.emit(day)
func set_day():
	day = true
	day_set.emit(day)
func is_day():
	return day
