extends Node2D
const dash_delay = .35
var candash = true
@onready var duration_timer = $DurationTimer
func start_dash(duration):
	duration_timer.wait_time = duration
	duration_timer.start()
	
func is_dashing():
	return !duration_timer.is_stopped()
# Called when the node enters the scene tree for the first time.
func end_dash():
	candash = false
	await get_tree().create_timer(dash_delay).timeout
	candash = true


func _on_duration_timer_timeout():
	end_dash()
