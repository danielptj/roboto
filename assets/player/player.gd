class_name Player
extends KinematicBody2D

var gravity = 4
var velocity = Vector2.ZERO

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
