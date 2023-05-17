extends KinematicBody2D
var is_textbox_hidden = global.is_textbox_hidden
var in_area = false

var alex_dustin_battle = 0

# Movement speed in pixels per second
export var speed := 100
var variable = 0
var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if in_area == false:
		if input.x > 0 and input.y == 0:
			velocity.x = 45
			velocity.y = 0
			move_and_slide(velocity)
			$AnimatedSprite.animation = "walk_right"
			variable = 6
		elif input.x < 0 and input.y == 0:
			velocity.x = -45
			velocity.y = 0
			move_and_slide(velocity)
			$AnimatedSprite.animation = "walk_left"
			variable = 4
	#else:
		#velocity.x = 0
		elif input.x == 0 and input.y > 0:
			velocity.y = 45
			velocity.x = 0
			move_and_slide(velocity)
			$AnimatedSprite.animation = "walk_down"
			variable = 2
		elif input.x == 0 and input.y < 0:
			velocity.y = -45
			velocity.x = 0
			move_and_slide(velocity)
			$AnimatedSprite.animation = "walk_up"
			variable = 8
	# else:
		# velocity.y = 0
		elif input.x == 0 and input.y == 0:
			if variable == 6:
				$AnimatedSprite.animation = "idle_right"
			elif variable == 8:
				$AnimatedSprite.animation = "idle_up"
			elif variable == 4:
				$AnimatedSprite.animation = "idle_left"
			elif variable == 2:
				$AnimatedSprite.animation = "idle_down"
		elif input.x > 0 and input.y > 0:
			velocity.x = 30
			velocity.y = 30
			move_and_slide(velocity)
			$AnimatedSprite.animation = "walk_down"
			variable = 2
		elif input.x < 0 and input.y < 0:
			velocity.x = -30
			velocity.y = -30
			move_and_slide(velocity)
			$AnimatedSprite.animation = "walk_up"
			variable = 8
		elif input.x > 0 and input.y < 0:
			velocity.x = 30
			velocity.y = -30
			move_and_slide(velocity)
			$AnimatedSprite.animation = "walk_up"
			variable = 8
		elif input.x < 0 and input.y > 0:
			velocity.x = -30
			velocity.y = 30
			move_and_slide(velocity)
			$AnimatedSprite.animation = "walk_down"
			variable = 2
	else:
		if variable == 6:
			$AnimatedSprite.animation = "idle_right"
		elif variable == 8:
			$AnimatedSprite.animation = "idle_up"
		elif variable == 4:
			$AnimatedSprite.animation = "idle_left"
		elif variable == 2:
			$AnimatedSprite.animation = "idle_down"

#func _on_Area2D_area_entered(area: Area2D) -> void:
	#in_area = true
	# get_node("../BattleArea/BoxxedText").show()
	# global.is_textbox_hidden = true
	#global.where_are_you = 0
	#global.is_textbox_hidden += 1
	#print(global.is_textbox_hidden)

# Hallway Luke textbox
func _on_LuukArea2D_body_entered(body: Node) -> void:
	# global.where_are_you = 1
	global.is_textbox_hidden += 1
	print(global.where_are_you)
	print(global.is_textbox_hidden)
	

# Programming room textbox
# func _on_BattleArea_body_entered(body: Node) -> void:
	

#func _on_Area2D_area_exited(area: Area2D) -> void:
	#in_area = false
	#global.is_textbox_hidden += 1





func _on_Area2D_area_entered(area: Area2D) -> void:
	in_area = true
	# get_node("../BattleArea/BoxxedText").show()
	global.is_textbox_hidden = true
	global.where_are_you = 0
	global.is_textbox_hidden += 1
	print(global.is_textbox_hidden)
