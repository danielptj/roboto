extends MoveState

func input(event: InputEvent) -> BaseState:
	var new_state = .input(event)
	if new_state:
		return new_state
	
	if Input.is_action_just_pressed("run"):
		return run_state

	return null
