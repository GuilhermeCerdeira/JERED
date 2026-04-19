extends Challenge

var breaks : bool = false
var lights : bool = false

@export var light_toggle : Sprite2D
@export var break_sprite : Sprite2D

func _on_timeout():
	if not check_win_condition():
		lose.emit(self)
	
func check_win_condition() -> bool:
	if break_sprite.frame == 1 and lights:
		win.emit(self, win_points_default_value())
		return true
	return false

func _on_lightbutton_toggled(toggled_on : bool):
	lights = toggled_on
	particle_emit(toggled_on)
	if toggled_on:
		light_toggle.rotation_degrees = -90
	else:
		light_toggle.rotation_degrees = 0

func _on_breakbutton_button_up():
	break_sprite.frame = 0

func _on_breakbutton_button_down():
	break_sprite.frame = 1
	if not check_win_condition():
		particle_emit(true)

func _on_particle_finished():
	check_win_condition()
