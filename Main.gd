extends Node

onready var spaces = $Spaces.get_children()
onready var diceLabel = $DiceLabel

var diceNum
var finalDiceNum

export onready var currentPlayer = $Players/BoardPlayer1

var isRolling = false

func _ready():
	randomize()
	$DiceTimer.start()
	isRolling = true

func _process(delta):
	if Input.is_action_pressed("ui_accept") and isRolling:
		$DiceTimer.stop()
		isRolling = false
		finalDiceNum = diceNum
		for i in range(currentPlayer.currentSpace, spaces.size()):
			print(spaces[i])
			currentPlayer.move_to(spaces[i].get_node("TweenPosition").translation)
			yield(currentPlayer, "move_done")

func _on_DiceTimer_timeout():
	diceNum = rand_range(1, 10)
	diceLabel.text = String(round(diceNum))
