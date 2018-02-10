extends KinematicBody

onready var tween = $Tween
var currentSpace = 0
signal move_done

func move_to(pos):
	print("Moving to ", pos)
	tween.interpolate_property(self, 'translation', translation, pos, 0.2, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween.start()

func _on_tween_completed( object, key ):
	print("Move done!")
	emit_signal("move_done")