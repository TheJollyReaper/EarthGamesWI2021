extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var players : Array
var active_player : int
var cam = null;

func next_player():
	active_player = (active_player + 1) % players.size()
	players[active_player].active = true
	# current method of changing cams is a little jank/jerky
	players[active_player].add_child(cam)

# Called when the node enters the scene tree for the first time.
func _ready():
	cam = get_node("/root/Main/Players/Player/PlayerCamera")
	players = self.get_children()
	active_player = 0
	players[active_player].active = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !players[active_player].active:
		players[active_player].remove_child(cam)
		next_player()
