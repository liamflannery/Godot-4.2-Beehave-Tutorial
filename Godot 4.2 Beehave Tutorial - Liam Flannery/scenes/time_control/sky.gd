extends WorldEnvironment
@export var day_colour : Color
@export var night_colour : Color
func _ready():
	TimeManager.day_set.connect(_update_colour)

func _update_colour(is_day):
	if is_day:
		environment.background_color = day_colour
		return
	environment.background_color = night_colour
