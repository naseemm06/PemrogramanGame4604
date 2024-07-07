extends Node2D

func _ready():
	if global.game_first_loading4 == true:
		$player.position.x = global.player_start_posx4
		$player.position.y = global.player_start_posy4
		#global.game_first_loading3 = true
		print("start world 444")
	else:
		$player.position.x = global.player_start_posx4
		$player.position.y = global.player_start_posy4
		#global.game_first_loading3 = true
		print("start world 4")

func _process(delta):
	changescene()



func _on_transition_world_1_body_entered(body):
	if body.has_method("player"):
		global.transition_scene4 = true

func _on_transition_world_1_body_exited(body):
	if body.has_method("player"):
		global.transition_scene4 = false

func changescene():
	if global.transition_scene4 == true:
		if global.current_scene4 == "world_4":
			#get_tree().change_scene_to_file("res://scenes/world.tscn")
			get_tree().call_deferred("change_scene_to_file", "res://scenes/world.tscn")
			#print("game loading3 balik", global.game_first_loading3)
			#global.game_first_loading3 = true
			#print("transition scene world 3 ", global.transition_scene3)
			#print("current scene world 3 ", global.current_scene3)
			global.finish_change4()
