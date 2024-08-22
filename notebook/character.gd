extends VBoxContainer
class_name Character


var CharacterID : String
var Name:String :
	set(value):
		character_name.text= "Name :" + value
		Name=value

@onready var character_name: Label = $Profile/Bio/CharacterName
@onready var data: Label = $Profile/Bio/Data
@onready var info: Label = $ScrollContainer/Info
@onready var splash: TextureRect = $Profile/Splash


signal SplashUpdated
signal NameUpdated
signal DataUpdated
signal InfoUpdated

func _ready():
	#Dialogic.signal_event.connect(DialogicSignal)
	pass

func DialogicSignal(
	CharID:String,
	signal_name:String, 
	Change=null,):
	if CharacterID!=CharID:
		return
	match signal_name:
		"NameUpdated":
			Name = Change
			NameUpdated.emit()
		"SplashUpdated":
			splash.texture = ImageTexture.create_from_image(Change)
			SplashUpdated.emit()
		"DataUpdated":
			data.text = "data :"+Change
			DataUpdated.emit()
		"InfoUpdated":
			info.text = "Info :"+Change
			InfoUpdated.emit()
		_:
			pass
