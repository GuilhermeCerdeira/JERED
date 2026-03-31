extends HBoxContainer

func _ready() -> void:
	pass

func set_data(rank, player_name, score):
	$Rank.text = str(rank) + "."
	$Name.text = str(player_name)
	$Score.text = str(score)
