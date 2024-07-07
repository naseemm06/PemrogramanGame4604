extends CharacterBody2D

var enemy_attack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var attack_ip = false

var speed = 100
var current_dir = "none"

var king_in_range = false

var death_animation_played = true
var is_death = false

func _physics_process(delta):
	if player_alive:
		player_movement(delta)
		enemy_attack()
		attack()
		current_camera()
		camera_home()
		update_health()
	
	#print(global.interaksi)
	if king_in_range == true and global.interaksi == true:
		#if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "main")
	
	if health <= 0 and death_animation_played :
		player_alive = false
		health = 0
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("death")
		is_death = true
		death_animation_played = false
		print("player has been killed")
		#self.queue_free()
		#if is_death == true:
			##$AnimatedSprite2D.play("death")
			##$AnimatedSprite2D.stop()
			##is_death = false
			#pass


func player_movement(delta):
	if not player_alive:
		return
	
	if global.interaksi == false:
		if Input.is_action_pressed("ui_right"):
			current_dir = "right"
			play_anim(1)
			velocity.x = speed
			velocity.y = 0 
		elif Input.is_action_pressed("ui_left"):
			current_dir = "left"
			play_anim(1)
			velocity.x = -speed
			velocity.y = 0
		elif Input.is_action_pressed("ui_down"):
			current_dir = "down"
			play_anim(1)
			velocity.y = speed
			velocity.x = 0
		elif Input.is_action_pressed("ui_up"):
			current_dir = "up"
			play_anim(1)
			velocity.y = -speed
			velocity.x = 0
		else:
			play_anim(0)
			velocity.x = 0
			velocity.y = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	if not player_alive:
		return

	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("right_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("right_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("left_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("left_idle")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("up_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("up_idle")
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("down_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("down_idle")

func player():
	pass
	

func _on_player_hit_body_entered(body):
	if body.has_method("enemy"):
		enemy_attack_range = true

func _on_player_hit_body_exited(body):
	if body.has_method("enemy"):
		enemy_attack_range = false

func enemy_attack():
	if not player_alive:
		return

	if global.bat_alive == true:
		if enemy_attack_range and enemy_attack_cooldown == true:
			health = health - 10
			enemy_attack_cooldown = false
			$attack_cooldown.start()
			print(health,"test")


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

func attack():
	if not player_alive:
		return

	var dir = current_dir
	
	if Input.is_action_just_pressed("attack"):
		global.player_current_attack = true
		attack_ip = true
		if dir == "right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("right_attack")
			$deal_attack.start()
		if dir == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("right_attack")
			$deal_attack.start()
		if dir == "down":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("down_attack")
			$deal_attack.start()
		if dir == "up":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("up_attack")
			$deal_attack.start()


func _on_deal_attack_timeout():
	$deal_attack.stop()
	global.player_current_attack = false
	attack_ip = false

func current_camera():
	if not player_alive:
		return

	if global.current_scene3 == "world" and global.current_scene4 == "world":
		if global.in_home == true:
			$world_camera.enabled = false
			$world_2_camera.enabled = false
			$world_3_camera.enabled = false
			$kam_home.enabled = true
			print("kam home")
		else:
			$world_camera.enabled = true
			$world_2_camera.enabled = false
			$world_3_camera.enabled = false
			$kam_home.enabled = false
			print("kam1")
	elif global.current_scene3 == "world_3" and global.current_scene4 == "world":
		$world_camera.enabled = false
		$world_2_camera.enabled = true
		$world_3_camera.enabled = false
		print("kam2")
	elif global.current_scene3 == "world_3" and global.current_scene4 == "world_4":
		$world_camera.enabled = false
		$world_2_camera.enabled = true
		$world_3_camera.enabled = false
		print("kam22")
	elif global.current_scene3 == "world" and global.current_scene4 == "world_4":
		$world_camera.enabled = false
		$world_2_camera.enabled = false
		$world_3_camera.enabled = true
		print("kam3")
	elif global.current_scene3 == "world_3" and global.current_scene4 == "world_4":
		$world_camera.enabled = false
		$world_2_camera.enabled = false
		$world_3_camera.enabled = true
		print("kam33")

func camera_home():
	if not player_alive:
		return

	if global.in_home == true:
		$world_camera.enabled = false
		$world_2_camera.enabled = false
		$world_3_camera.enabled = false
		$kam_home.enabled = true
		print("kam home")

func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

func _on_bar_timer_timeout():
	if health < 100:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0


func _on_detection_area_body_entered(body):
	if body.has_method("witch"):
		king_in_range = true


func _on_detection_area_body_exited(body):
	if body.has_method("witch"):
		king_in_range = false
