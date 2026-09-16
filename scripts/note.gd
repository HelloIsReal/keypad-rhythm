extends Node2D

@export var myRank: int = -1
var noteImage = preload("res://scenes/noteVisual.tscn")


func _process(delta: float) -> void:
	if(Input.is_action_just_pressed(str(myRank))):
		print(myRank)
		var ghostImage = noteImage.instantiate()
		ghostImage.scale = Vector2(1.2,1.2)
		ghostImage.modulate.a = 1
		ghostImage.global_position = global_position
		get_tree().current_scene.add_child(ghostImage)
		
		
		
