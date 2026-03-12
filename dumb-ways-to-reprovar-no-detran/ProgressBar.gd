extends ProgressBar

@export var timer : Timer

func _ready():
	max_value = timer.wait_time
	timer.start()

func _process(_delta):
	value = timer.wait_time - timer.time_left
