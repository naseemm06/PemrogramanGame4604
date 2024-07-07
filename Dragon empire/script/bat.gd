extends CharacterBody2D

var speed = 35
var player_chase = false
var player = null
var death_play = true
var animation_death = true

var health = 100
var player_inattack_zone = false

var can_take_damage = true

@export var knockback_power = 500

func _physics_process(delta):
	update_health()
	deal_damage()
		
		##$AnimatedSprite2D.play("death")
		##death_play = false
		##animation_death = false
		##print("animation_false")
		##self.queue_free()
	#else:
		#var healthbar = $healthbar
		#healthbar.value = health
		#healthbar.visible = false
		#
		#self.queue_free()
			#
			##self.queue_free()
			##print("deat")
	
	if player_chase:
		position += (player.position - position)/speed
		
		$AnimatedSprite2D.play("bat_walk")
		if(player.position.x - position.x) < 0 :
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else :
		$AnimatedSprite2D.play("idle")

func _on_detector_body_entered(body):
	player = body
	player_chase = true


func _on_detector_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass

func _on_bat_hit_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true
		

func _on_bat_hit_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
		

func deal_damage():
	if player_inattack_zone and global.player_current_attack == true:
		if can_take_damage == true:
			health = health - 20
			
			$take_damage_cooldown.start()
			can_take_damage = false
			print("bat health =", health)
			if health <= 0:
				global.bat_alive = false
				can_take_damage = false
				print("bat_alive")
				if health <= 0:
					self.queue_free()
			else:
				apply_knockback(player.velocity)

func _on_take_damage_cooldown_timeout():
	can_take_damage = true

func update_health():
	var healthbar = $healthbar
	
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else :
		healthbar.visible = true


func apply_knockback(enemy_velocity):
	var knockback_direction = enemy_velocity.normalized() * -1
	knockback_direction *= knockback_power
	velocity = knockback_direction # Mengatur properti 'velocity'
	move_and_slide() # Memanggil 'move_and_slide()' dengan 'velocity' sebagai argumen

