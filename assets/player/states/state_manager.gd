extends Node

export (NodePath) var starting_state

var current_state: BaseState

func change_state(new_state: BaseState) -> void:
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()

# Inicializa a máquina de estados dando o controle à cada estado
func init(player: Player) -> void:
	for child in get_children():
		child.player = player

	# Inicializa no estado Idle
	change_state(get_node(starting_state))
	
# Funções de processamento e input para serem chamadas e alteradas pelo player
func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)
	print(typeof(current_state))

func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state:
		change_state(new_state)

func process(delta: float) -> void:
	var new_state = current_state.process(delta)
	if new_state:
		change_state(new_state)
