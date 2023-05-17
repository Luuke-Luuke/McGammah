extends CanvasLayer
# var is_textbox_hidden = global.is_textbox_hidden

const CHAR_READ_RATE = 0.05

onready var textbox_container = $TextboxContainer
onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

func _on_LuukArea2D_body_entered(body: Node) -> void:
	#if global.where_are_you == 1:
	queue_text("Why don't I do work in your class?")
	queue_text("It's because I'm always busy.")
	queue_text("Busy doing nothing.")
	queue_text("Hey man, doing nothing is a lot of work.")
	queue_text("It takes up all my time. Sorry.")
		#global.where_are_you = 4

func _on_BattleArea_area_entered(area: Area2D) -> void:
	queue_text("Stop right there, criminal scum!")
	queue_text("You have committed crimes against Skyrim and her people!")
	queue_text("What say you in your defense?")

	


enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

func _ready():
	print("Starting state: State.READY")
	hide_textbox()
	# if global.where_are_you == 0:
		
	# elif global.where_are_you == 1:
		

func _process(delta):
	match current_state:
		State.READY:
			if (global.is_textbox_hidden % 2) == 1:
				if !text_queue.empty():
					show_textbox()
					display_text()
		State.READING:
			if (global.is_textbox_hidden % 2) == 1:
				if Input.is_action_just_pressed("ui_accept"):
					label.percent_visible = 1.0
					$Tween.stop_all()
					end_symbol.text = "v"
					change_state(State.FINISHED)
		State.FINISHED:
			if (global.is_textbox_hidden % 2) == 1:
				if Input.is_action_just_pressed("ui_accept"):
					change_state(State.READY)
					hide_textbox()

func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	# global.tt()
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()
	# global.tt()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.percent_visible = 0.0
	change_state(State.READING)
	show_textbox()
	$Tween.interpolate_property(label, "percent_visible", 0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Tween_tween_all_completed() -> void:
	end_symbol.text = "v"
	change_state(State.FINISHED)

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")


