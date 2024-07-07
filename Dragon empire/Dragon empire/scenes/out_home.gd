extends Area2D

var out_home = false

#func _on_body_entered(body):
	#out_home = true
#
#func _on_body_exited(body):
	#out_home = false
#
#func _process(delta):
	#if out_home == true:
		#if Input.is_action_just_pressed("masuk"):
			#get_tree().change_scene_to_file("res://scenes/world_2.tscn")
			##print("out_home")
			#global.in_home = false
			#global.outt_home = true
			##print(global.in_home)
