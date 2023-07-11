extends CanvasLayer

var bolts = 0

func _ready():
	$Bolts.text = String(bolts)

func _on_bolt_collected():
	bolts += 1
	_ready()
