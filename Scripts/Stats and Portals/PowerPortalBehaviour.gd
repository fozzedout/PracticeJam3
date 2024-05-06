extends Area2D

var latch: bool = false

func _on_body_entered(body):
	if latch == true:
		return
		
	latch = true

	var player_vars = get_node("/root/PlayerVariables")
	if name == "Power":
		player_vars.level_strength += 1
	if name == "Speed":
		player_vars.level_speed += 1
	if name == "Health":
		player_vars.level_health += 1
		$"../../CanvasLayer/TextureProgressBar".max_value = player_vars.level_health * 4
		body.health += 1
	
	#var level = "res://Scenes/Levels/Level{level}.tscn".format({"level": randi_range(1,12)})
	#get_tree().change_scene_to_file(level)
	get_node("/root/ChoosePath/PathChosen").start()
	latch = false


func _on_body_exited(_body):
	latch = false
