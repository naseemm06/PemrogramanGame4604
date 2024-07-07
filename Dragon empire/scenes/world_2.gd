extends Node2D

func _ready():
	global.interaksi = false
	if global.game_first_loading1 == true and global.outt_home == false:
		$player.position.x = global.player_start_posx1
		$player.position.y = global.player_start_posy1
		print("start world 2")
	elif global.game_first_loading1 == true and global.outt_home == true:
		$player.position.x = global.position_exit_homex
		$player.position.y = global.position_exit_homey
		global.outt_home = false
		print("out home")
	else:
		$player.position.x = global.player_start_posx1
		$player.position.y = global.player_start_posy1
		print("random")

func _process(delta):
	global.interaksi = false
	change_scene()
	changehome()

func door():
	pass

func _on_world_1_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true


func _on_world_1_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false

func change_scene():
	#print(global.current_scene)
	if global.transition_scene == true:
		if global.current_scene == "world_2":
			get_tree().call_deferred("change_scene_to_file", "res://scenes/world.tscn")
			#global.game_first_loading1 = false
			#global.game_first_loading = true
			global.finish_changescene()
			#print(global.current_scene)

func _on_house_transition_body_entered(body):
	global.masuk = true

func _on_house_transition_body_exited(body):
	global.masuk = false

func changehome():
	#print(global.masuk, "cek")
	if global.masuk == true:
		#global.masuk = false
		#print(global.masuk, "cek")
		if Input.is_action_just_pressed("masuk"):
			get_tree().call_deferred("change_scene_to_file","res://scenes/home.tscn")
			#print("home")
			global.in_home = true
			#print(global.in_home)

func _on_interaksi_body_entered(body):
	global.interaksi = true
	#print("sukses")

func _on_interaksi_body_exited(body):
	global.interaksi = false
	#print("gagal")

