extends Area2D

func _on_bolt_body_entered(body):
	body._add_bolt()
	queue_free()
