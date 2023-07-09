extends KinematicBody2D

var speed = 35
var velocity = Vector2.ZERO
export var direction = -1

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $hitbox.shape.get_extents().x * direction

func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor():
		direction = direction*-1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $hitbox.shape.get_extents().x * direction
	
	velocity.y += 3
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_top_checker_body_entered(body):
	body.bounce()
	$AnimatedSprite.play("die")
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_layer_bit(4,false)
	$top_checker.set_collision_mask_bit(0,false)
	$side_checker.set_collision_layer_bit(4,false)
	$side_checker.set_collision_mask_bit(0,false)
	yield($AnimatedSprite, "animation_finished")
	queue_free()

func _on_side_checker_body_entered(body):
	body.hurt(position.x)
#	get_tree().change_scene("res://level1.tscn")
