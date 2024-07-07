extends Node2D

func _ready():
	if global.game_first_loading3 == true:
		$player.position.x = global.player_start_posx3
		$player.position.y = global.player_start_posy3
		#global.game_first_loading3 = true
		print("start world 333")
	else:
		$player.position.x = global.player_start_posx3
		$player.position.y = global.player_start_posy3
		#global.game_first_loading3 = true
		print("start world 3")
		

func _process(delta):
	changescene()

func _on_transition_world_1_body_entered(body):
	if body.has_method("player"):
		global.transition_scene3 = true

func _on_transition_world_1_body_exited(body):
	if body.has_method("player"):
		global.transition_scene3 = false

func changescene():
	if global.transition_scene3 == true:
		if global.current_scene3 == "world_3":
			#get_tree().change_scene_to_file("res://scenes/world.tscn")
			get_tree().call_deferred("change_scene_to_file", "res://scenes/world.tscn")
			print("game loading3 balik", global.game_first_loading3)
			#global.game_first_loading3 = true
			#print("transition scene world 3 ", global.transition_scene3)
			#print("current scene world 3 ", global.current_scene3)
			global.finish_change()
			
