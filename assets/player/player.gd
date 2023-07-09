class_name Player
extends KinematicBody2D

var gravity = 4
var velocity = Vector2.ZERO
var bolts = 0
var bolts_max = 7
signal bolt_collected

onready var animations = $animations
onready var states = $state_manager

func _ready() -> void:
	# Inicializa a máquina de estados, passando referência de player para que state manager a espalhe aos outros estados
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)

func _process(delta: float) -> void:
	states.process(delta)

func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://level1.tscn")
	
func _add_bolt():
	bolts += 1
	emit_signal("bolt_collected")
	if bolts == bolts_max:
		get_tree().change_scene("res://VictoryScreen.tscn")
		
func bounce():
	velocity.y = -100
	
func hurt(var enemyposx):
	set_modulate(Color(1,0.3,0.3))
	velocity.y = -40
	if position.x < enemyposx:
		velocity.x = -600
	elif position.x > enemyposx:
		velocity.x = 600
	Input.action_release("move_left")
	Input.action_release("move_right")
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://level1.tscn")
