extends Button


export var reference_path = ""
export var start_focused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if (start_focused):
		grab_focus()
	connect("mouse_entered", self, "_on_Button_mouse_entered")
	connect("pressed", self, "_on_Button_Pressed")

func _on_Button_mouse_entered():
	grab_focus()
	
func _on_Button_Pressed():
	if (reference_path == ""):
		get_tree().quit()
	elif (reference_path == "resume"):
		pass
	else:
		get_tree().change_scene(reference_path)
		
