extends Node2D
var rng = RandomNumberGenerator
var note = preload("res://scenes/note.tscn")
var spawnOffset = Vector2(300,100)

@export var bpm = 100
@export var notes = [1,2,3,4,5]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var noteRank=0
	var noteOffset=0
	for i in 3:
		noteOffset+=1
		for j in 3:
			
			noteRank += 1
			var newNote = note.instantiate()
			get_tree().current_scene.add_child(newNote)
			newNote.global_position.x += 150 * j
			newNote.global_position.y += 150 * noteOffset
			newNote.global_position += spawnOffset
			newNote.myRank = noteRank
			#print("x:",i,", y:",j)
