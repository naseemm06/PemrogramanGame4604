extends Node2D

func _ready():
	#if global.game_first_loading == true:
		#if global.game_first_loading3 == true:
			#$player.position.x = global.player_start_posx
			#$player.position.y = global.player_start_posy
		#else :
			#$player.position.x = global.player_exit_side_posx3
			#$player.position.y = global.player_exit_side_posy3
			#global.game_first_loading3 = true
	#elif global.game_first_loading == false:
		#if global.game_first_loading3 == true:
			#$player.position.x = global.player_exit_side_posx
			#$player.position.y = global.player_exit_side_posy
		#else :
			#$player.position.x = global.player_exit_side_posx3
			#$player.position.y = global.player_exit_side_posy3
			#global.game_first_loading3 = true
		
	if global.game_first_loading == true:
		if global.game_first_loading3 == true:
			if global.game_first_loading4 == true:
				$player.position.x = global.player_start_posx
				$player.position.y = global.player_start_posy
			else:
				$player.position.x = global.player_exit_side_posx4
				$player.position.y = global.player_exit_side_posy4
				global.game_first_loading4 = true
		else :
			if global.game_first_loading4 == true:
				$player.position.x = global.player_exit_side_posx3
				$player.position.y = global.player_exit_side_posy3
				global.game_first_loading3 = true
			else:
				print("gagal")
	elif global.game_first_loading == false:
		if global.game_first_loading3 == true:
			if global.game_first_loading4 == true:
				$player.position.x = global.player_exit_side_posx
				$player.position.y = global.player_exit_side_posy
			else:
				$player.position.x = global.player_exit_side_posx4
				$player.position.y = global.player_exit_side_posy4
				global.game_first_loading4 = true
		else :
			if global.game_first_loading4 == true:
				$player.position.x = global.player_exit_side_posx3
				$player.position.y = global.player_exit_side_posy3
				global.game_first_loading3 = true
			else:
				print("gagal2")
	
func _process(delta):
	change_scene()
	change_scene3()
	change_scene4()
	
	
func _on_world_2_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true


func _on_world_2_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false

func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "world":
			#print(global.current_scene)
			get_tree().change_scene_to_file("res://scenes/world_2.tscn")
			global.game_first_loading = false
			#print("game loading", global.game_first_loading)
			global.finish_changescene()
			#print(global.current_scene)
		
	else:
		pass



func _on_world_3_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_scene3 = true


func _on_world_3_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene3 = false

func change_scene3():
	if global.transition_scene3 == true:
		#print("transition scene = ", global.transition_scene3)
		if global.current_scene3 == "world":
			#print("current scene =", global.current_scene3)
			get_tree().call_deferred("change_scene_to_file", "res://scenes/world_3.tscn")
			#print("transition sceneee = ", global.transition_scene3)
			global.game_first_loading3 = false
			#print("game loading 3", global.game_first_loading3)
			global.finish_change()
			#print("current scene after =", global.current_scene3)


func _on_world_4_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_scene4 = true


func _on_world_4_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene4 = false

func change_scene4():
	if global.transition_scene4 == true:
		#print("transition scene = ", global.transition_scene3)
		if global.current_scene4 == "world":
			#print("current scene =", global.current_scene3)
			get_tree().call_deferred("change_scene_to_file", "res://scenes/world_4.tscn")
			#print("transition sceneee = ", global.transition_scene3)
			global.game_first_loading4 = false
			print("game loading 4", global.game_first_loading4)
			global.finish_change4()
			#print("current scene after =", global.current_scene3)
