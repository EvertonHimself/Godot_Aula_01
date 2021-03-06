extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerName = "player"
var velocity = Vector3(0,0,0)
const SPEED = 20
const ROT_SPEED = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#print("Hello, Godot!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	#print("Hello");
	#pass
	#print(playerName)
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROT_SPEED));
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROT_SPEED));
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	
	# Faz o jogador ir para frente.
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROT_SPEED));
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROT_SPEED));
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
		
	move_and_slide(velocity)
