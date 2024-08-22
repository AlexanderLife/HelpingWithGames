extends ScrollContainer

func _ready() -> void:
	var Imgs:Array[Image]=[]
	Imgs.append(ICON.get_image())
	SetUpCharacters(Imgs)
	pass

const StartingChar:Array[Dictionary]=[
	{
		"name":"Silly",
		"data":"data",
		"info":"jkshadfjkashdfkjhdsakjfh
		asdklfjasldkjflksadjfljsadlkfjklsdjafklklj
		sadkfjlkasdjflksdajfl;djsalkjf;sa
		adskljflkajsdfjasdlf'jlj
		asdfjlkasdjklfjkldsaajlk",
	},
]

const ICON = preload("res://icon.svg")

const CHARACTER = preload("res://notebook/character.tscn")

func SetUpCharacters(imgs:Array[Image]):
	var index:int = 0
	for D:Dictionary in StartingChar:
		var newC:Character = CHARACTER.instantiate()
		newC.CharacterID="character_"+str(index)
		add_child(newC)
		index+=1
	index=0
	for child:Character in get_children():
		child.DialogicSignal(
			"character_"+str(index),
			"NameUpdated",
			StartingChar[index]["name"],
		)
		child.DialogicSignal(
			"character_"+str(index),
			"SplashUpdated",
			imgs[index],
		)
		child.DialogicSignal(
			"character_"+str(index),
			"DataUpdated",
			StartingChar[index]["data"],
		)
		child.DialogicSignal(
			"character_"+str(index),
			"InfoUpdated",
			StartingChar[index]["info"],
		)
