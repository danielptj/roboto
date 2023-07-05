extends MoveState

export (float) var dash_time = 0.4

var current_dash_time: float = 0
var dash_direction: int = 0

# define a direção de dash de acordo com o input ou a direção em que o jogador está olhando
func enter() -> void:
	.enter()
	
	current_dash_time = dash_time
	
	if player.animations.flip_h:
		dash_direction = -1
	else:
		dash_direction = 1

func input(event: InputEvent) -> BaseState:
	return null

func get_movement_input() -> int:
	return dash_direction

func process(delta: float) -> BaseState:
	current_dash_time -= delta

	if current_dash_time > 0:
		return null

	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		if Input.is_action_pressed("run"):
			return run_state
		return walk_state
	return idle_state
