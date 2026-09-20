extends Node2D

var targetRank=0
var appearLength = 1000 #milliseconds


func _ready() -> void:
	await get_tree().create_timer(appearLength/1000).timeout
	$ding.play()
