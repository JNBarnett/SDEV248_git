extends RigidBody2D

@export var acceleration:float = 30.0
@export var jump_accel:float = -500.0


var hp: float = 10.0
var xp: int = 1
var mp: int = 0
@onready var label: RichTextLabel = $"../RichTextLabel"

func _ready() -> void:
	pass
	

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("Right"):
		apply_central_impulse(Vector2(acceleration,0.5))
	elif Input.is_action_pressed("Left"):
		apply_central_impulse((Vector2(-acceleration,0.5)))
	elif Input.is_action_just_pressed("Up"):
		apply_central_impulse(Vector2(0, jump_accel))
		
		var hit = randf_range(-5.5, 5.5);
		hp += hit;
		var experience = randi() % 50
		if experience > 45:
			xp += 1;
		var magic = randi() % 50
		if magic > 47:
			mp += 1
		
		var output = ""
		output += "HP: " + str("%.2f" % hp) + "\n"
		output += "XP: " + str(xp) + "\n"
		output += "MP: " + str(mp) + "\n"

		label.text = output;
	else:
		apply_central_impulse(Vector2.ZERO)
	
	if Input.is_action_just_pressed("ui_page_down"):
		save()
	
	if Input.is_action_just_pressed("ui_page_up"):
		load_data()


func save():
		var file:= FileAccess.open("user://game_state.json", FileAccess.WRITE)
		var data:= {
			"HP": hp,
			"XP": xp,
			"MP": mp
		}
		file.store_string(str(data));
		file.close();
		label.text = "Game Data Saved"


func load_data():
	if FileAccess.file_exists("user://game_state.json"):
		var file:= FileAccess.open("user://game_state.json", FileAccess.READ)
		var data = JSON.parse_string(file.get_as_text())
		if data is Dictionary:
			hp = data["HP"]
			xp = data["XP"]
			mp = data["MP"]
			label.text = "Game Loaded"
		else:
			label.text = "Error Loading"
