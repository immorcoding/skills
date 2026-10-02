extends CharacterBody2D

enum State { IDLE, CHASE }
var state := State.IDLE

func _physics_process(_delta: float) -> void:
	match state:
		State.IDLE: pass
		State.CHASE: pass
