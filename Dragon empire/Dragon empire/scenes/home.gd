extends Node2D

func _ready():
	if global.in_home == true:
		$player.position.x = global.position_start_homex
		$player.position.y = global.position_start_homey
		print("in home")
	else:
		pass

func _process(delta):
	outhome()

func _on_out_home_body_entered(body):
	global.keluar = true
	#print("succes")


func _on_out_home_body_exited(body):
	global.keluar = false
	#print("gagal")

func outhome():
	#print(global.keluar)
	if global.keluar == true:
		if Input.is_action_just_pressed("masuk"):
			get_tree().call_deferred("change_scene_to_file","res://scenes/world_2.tscn")
			#print("out_home")
			global.in_home = false
			global.outt_home = true
			#print(global.in_home)
