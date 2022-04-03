extends Area

export(String, FILE, "*.tscn") var NEXT_LEVEL = ""

func _on_VictoryZone_body_entered(body):
	if body.name == "Ball":
		get_tree().change_scene(NEXT_LEVEL)
