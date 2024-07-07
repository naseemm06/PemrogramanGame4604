extends CharacterBody2D

var speed = 35
var dragon = null
var dragon_chase = false

func _physics_process(delta):
	if dragon_chase:
		position += (dragon.position - position)/speed
		$AnimatedSprite2D.play("walk_left")
		if(dragon.position.x - position.x) < 0 :
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	else :
		$AnimatedSprite2D.play("idle")

func _on_detection_body_entered(body):
	dragon = body
	dragon_chase = true


func _on_detection_body_exited(body):
	dragon = null
	dragon_chase = false
