extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(100):
		await get_tree().create_timer(0.01).timeout
		$".".modulate.a -= 0.02
	queue_free()
