extends CharacterBody2D

var given = false
const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

func _ready():
	given = blobals.gave

func _physics_process(delta):
	#print("given: ", given)
	#print("blobals.gave: ", blobals.gave)
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if given == true:
		print("Testing")
		get_tree().change_scene_to_file("res://level_2.tscn")
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("Move.L", "Move.R")
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	
	# Flip the Sprite 
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true 
	
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")
	
	# Apply movement 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
