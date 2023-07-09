extends CanvasLayer

var bolts = 0
var bolts_max = 1

func _ready():
	$Bolts.text = String(bolts)

func _on_bolt_collected():
	bolts += 1
	_ready()
