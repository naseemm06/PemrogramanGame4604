extends Node


var player_current_attack = false

var in_home = false
var outt_home = false
var bat_alive = true

#Position Start Player
var position_start_homex = 5
var position_start_homey = 35
var player_start_posx = 1
var player_start_posy = 91
var player_start_posx1 = 13
var player_start_posy1 = 109
var player_start_posx3 = 20
var player_start_posy3 = 44
var player_start_posx4 = 483
var player_start_posy4 = 27


var current_scene = "world"
var current_scene3 = "world"
var current_scene4 = "world"
var transition_scene = false
var transition_scene3 = false
var transition_scene4 = false
var masuk = false
var keluar = false



var position_exit_homex = 62
var position_exit_homey = 73
var player_exit_side_posx = 464
var player_exit_side_posy = 99
var player_exit_side_posx1 = 467
var player_exit_side_posy1 = 131
var player_exit_side_posx3 = 317
var player_exit_side_posy3 = 9
var player_exit_side_posx4 = 329
var player_exit_side_posy4 = 246


var game_first_loading = true
var game_first_loading1 = true
var game_first_loading3 = true
var game_first_loading4 = true


var interaksi = false
var king_yes = true
var king_no = false

func finish_changescene():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "world_2"
			#print("succes")
		else :
			current_scene = "world"
			#print("gagal")
	else:
		if current_scene == "world":
			current_scene = "world_2"
		else:
			current_scene = "world"


func finish_change():
	if transition_scene3 == true:
		#print("succes")
		transition_scene3 = false
		if current_scene3 == "world":
			#print("succes222")
			current_scene3 = "world_3"
		else :
			current_scene3 = "world"
	else:
		pass
		#print("gagal")
		#transition_scene3 = false
		#if current_scene3 == "world":
			#print("succes222")
			#current_scene3 = "world_3"
		#else :
			#current_scene3 = "world"
		

func finish_change4():
	if transition_scene4 == true:
		#print("succes")
		transition_scene4 = false
		if current_scene4 == "world":
			#print("succes222")
			current_scene4 = "world_4"
		else :
			current_scene4 = "world"
	else:
		pass
