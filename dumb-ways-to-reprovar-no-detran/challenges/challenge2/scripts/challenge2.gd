extends Challenge

@export var prf_animation : AnimationPlayer

var car_1_detected : bool = false
var car_2_detected : bool = false

var car_3_detected : bool = false

func _ready():
	super._ready()

func _on_timeout():
	if not check_win_condition():
		if not check_lose_condition():
			lose.emit(self)

func _on_button_car_1_pressed():
	particle_emit(true)
	car_1_detected = true

func _on_button_car_2_pressed():
	particle_emit(true)
	car_2_detected = true

func _on_button_car_3_pressed():
	prf_animation.play("right")
	particle_emit(false)
	car_3_detected = true

func check_win_condition() -> bool:
	if car_1_detected and car_2_detected:
		win.emit(self, win_points_default_value())
		return true
	return false

func check_lose_condition() -> bool:
	if car_3_detected:
		lose.emit(self)
		return true
	return false

func _on_particle_finished():
	if not check_win_condition():
		check_lose_condition()
