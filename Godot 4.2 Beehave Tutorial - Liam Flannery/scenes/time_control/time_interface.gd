extends Control
@onready var set_day_button = $CanvasLayer/HBoxContainer/set_day
@onready var set_night_button = $CanvasLayer/HBoxContainer/set_night
@onready var sun_icon = $CanvasLayer/sun_icon
@onready var moon_icon = $CanvasLayer/moon_icon
@export var day_colour : Color
@export var night_colour : Color
@onready var sky = $CanvasLayer/sky
func _ready():
	set_day_button.pressed.connect(_set_day)
	set_night_button.pressed.connect(_set_night)
	TimeManager.day_set.connect(_update_sky)
	_update_sky(TimeManager.is_day())
	
func _set_day():
	TimeManager.set_day()

func _set_night():
	TimeManager.set_night()

func _update_sky(is_day):
	sun_icon.visible = is_day
	moon_icon.visible = !is_day
	sky.color = day_colour if is_day else night_colour
	
