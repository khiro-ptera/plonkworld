extends CharacterBody2D

@export var speed = 400
var face = 0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	if velocity == Vector2(0, 0):
		$AnimatedSprite2D.play("idle_" + str(face))
	elif velocity.length_squared() > 1000000:
		$AnimatedSprite2D.play("run_" + str(face))
	else:
		$AnimatedSprite2D.play("move_" + str(face))
