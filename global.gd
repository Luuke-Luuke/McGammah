extends Node

var is_textbox_hidden = 0
# If the number is even, the textbox is hidden.
# If the number is odd, the textbox is showing.

var where_are_you = 1
# If the variable is 0, you are in the Programming room.
# If the variable is 1, you are talking to Luke.
# If the variable is 2, you are talking to Sam.
# If the variable is 3, you are talking to Jackson.
# If the variable is 4, you aren't talking to anyone.


func tt():
	is_textbox_hidden = is_textbox_hidden + 1
