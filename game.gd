extends Node2D
var rng = RandomNumberGenerator
var tile = preload("res://scenes/tile.tscn")
var spawnOffset = Vector2(800,300)
var songPlaying=true

@export var bpm = 138
@export var songs:Array[Song]
var songIndex:int = 0
var noteIndex=0

var currentTime: float = 0.0
var currentNote=0

var secondsPerbeat: float# = bpm/60
#var eightBeats: float

var noteSpeed: float = 1.0


#var measure:=0.0

func _ready() -> void:
	print("BPM: ", bpm)
	print("Seconds per beat: ", secondsPerbeat)
	secondsPerbeat = 60.0 / bpm
	
	var noteRank=0
	var noteOffset=0
	for i in 3:
		noteOffset+=1
		for j in 3:
			noteRank += 1
			
			var newTile = tile.instantiate()
			get_tree().current_scene.add_child(newTile)
			
			newTile.global_position.x += 150 * j
			newTile.global_position.y += 150 * noteOffset
			newTile.global_position += spawnOffset
			newTile.myRank = noteRank
			#print("x:",i,", y:",j)
			
	#for i in songIndex:
		#songs[songIndex].notes[1].lane
	songStart()
	#await get_tree().create_timer(0.4).timeout
	#var running=true
	#while(songPlaying):
		#if(running):
			#running=false
			#await get_tree().create_timer(bpmPerSecond/8).timeout
			#currentTime+=1
			#
			#print(currentTime)
			#print(bpmPerSecond)
			#if(currentTime % 5 == 0):
				#print("ping!")
				#$ding.play()
			#running=true
			

func _process(delta: float) -> void:
	
	#measure = $badApple.get_playback_position()# * (bpm / 60)
	#songs[songIndex].notes[1].lane
	#$badApple.get_playback_position()
	if $badApple.playing:
		currentTime = $badApple.get_playback_position()
		var notes = songs[songIndex].notes
		
		#var currentBeat = currentTime / secondsPerbeat
		
		if noteIndex >= notes.size():
			return
		var noteData = notes[noteIndex]
		var noteTime = noteData.beat * secondsPerbeat
		var spawnTime = noteTime - noteSpeed
		
		if currentTime >= spawnTime:
			spawnNote(noteData)
			noteIndex+=1
			

func songStart():
	$badApple.play()
	#tickStart()
	
#func tickStart():
	
		
		#if(currentTime>=notes[currentNote]):
			#currentNote+=1
			#spawnNote()

func _on_bad_apple_finished() -> void:
	songPlaying=false

func spawnNote(data):
	print("spawned on beat ",data.beat)
	print("spawned on number ",data.lane)
	var newNote = tile.instantiate()
	get_tree().current_scene.add_child(newNote)
	
	#$ding.play()
	


#func _on_bpm_timeout():
	
