class_name GameUIManager

extends Node3D

@onready var coinLabel : Label = $Control_GameplayUI/HBoxContainer_Coin/Label_Coin

@export var player : Node3D

@onready var blackColorRect : ColorRect = $Control_Game/ColorRect
@onready var gamePause : Container = $Control_Game/GamePause
@onready var gameFinish : Container = $Control_Game/GameFinish
@onready var gameOver : Container = $Control_Game/GameOver

func togglePauseUI(toggle: bool):
	blackColorRect.visible = toggle
	gamePause.visible = toggle

# Called when the node enters the scene tree for the first time.
func _ready():
	player.coinNumberUpdated.connect(updateCoinLabel)
	
func updateCoinLabel(newValue: int):
	coinLabel.text = str(newValue)
