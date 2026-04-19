extends PanelContainer

func _ready() -> void:
	self.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	%Name.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pass

func set_data(rank, player_name, score):
	%Rank.text = "#" + str(rank)
	%Name.text = player_name
	%Score.text = str(score)
	

	var style = get_theme_stylebox("panel").duplicate()
	if rank == 1:
		style.bg_color = Color("d4af37")
		%Name.add_theme_color_override("font_color", Color.BLACK)
	elif rank == 2:
		style.bg_color = Color("c0c0c0")
	elif rank == 3:
		style.bg_color = Color("cd7f32")
	else:
		if rank % 2 == 0:
			style.bg_color = Color(1, 1, 1, 0.05)
		else:
			style.bg_color = Color(0, 0, 0, 0.2)
			
	add_theme_stylebox_override("panel", style)
