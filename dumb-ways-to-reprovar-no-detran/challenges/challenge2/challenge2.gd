extends Challenge

@export var particle : PackedScene
@export var prf_animation : AnimationPlayer

@export var right_texture : CompressedTexture2D
@export var wrong_texture : CompressedTexture2D

var car_1_detected : bool = false
var car_2_detected : bool = false

var car_3_detected : bool = false

func _ready():
	super._ready()

func _on_timeout():
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

func check_win_condition():
	if car_1_detected and car_2_detected:
		win.emit(self, (timer_instance.time_left/timer_instance.wait_time) * 100)

func check_lose_condition():
	if car_3_detected:
		lose.emit(self)

func _on_particula_finished():
	check_win_condition()
	check_lose_condition()

func particle_emit(right : bool):
	var particle_instance = particle.instantiate() as CPUParticles2D
	if right:
		particle_instance.texture = right_texture
	else:
		particle_instance.texture = wrong_texture
	add_child(particle_instance)
	particle_instance.connect("finished", _on_particula_finished)
	particle_instance.emitting = true
	
	
	
	
	
	
	
	
	
	
	
	
	
	
