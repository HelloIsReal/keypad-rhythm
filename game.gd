extends Node2D
var rng = RandomNumberGenerator
var note = preload("res://scenes/tile.tscn")
var spawnOffset = Vector2(800,300)
var songPlaying=true

@export var bpm = 138
@export var songs:Array[Song]
var songIndex:int = 0

var bpmPerSecond: float = bpm/60
var currentTime=0
var currentNote=0
var measure:=0.0

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
	for i in songIndex:
		songs[songIndex].notes[1].lane
	songStart()
	await get_tree().create_timer(0.4).timeout
	var running=true
	while(songPlaying):
		if(running):
			running=false
			await get_tree().create_timer(bpmPerSecond/8).timeout
			currentTime+=1
			
			print(currentTime)
			print(bpmPerSecond)
			if(currentTime % 5 == 0):
				print("ping!")
				$ding.play()
			running=true
			

func _process(delta: float) -> void:
	measure = $badApple.get_playback_position()# * (bpm / 60)
	songs[songIndex].notes[1].lane
	#$badApple.get_playback_position()

func songStart():
	$badApple.play()
	#tickStart()
	
#func tickStart():
	
		
		#if(currentTime>=notes[currentNote]):
			#currentNote+=1
			#spawnNote()

func _on_bad_apple_finished() -> void:
	songPlaying=false

func spawnNote():
	pass
	


#func _on_bpm_timeout():
	
