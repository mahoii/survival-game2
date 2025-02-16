extends Node3D
var health : Need
var hunger : Need
var thirst : Need
@export var no_hunger_health_decay : float
@export var no_thirst_health_decay : float

func _ready():
	health = get_node("Health")
	hunger = get_node("Hunger")
	thirst = get_node("Thirst")
	
	health.value = health.start_value
	hunger.value = hunger.start_value
	thirst.value = thirst.start_value

func _process(delta):
	hunger.subtract(hunger.decay_rate * delta)
	thirst.subtract(thirst.decay_rate * delta)
	
	if hunger.value == 0:
		health.subtract(no_hunger_health_decay * delta)
	if thirst.value == 0:
		health.subtract(no_thirst_health_decay * delta)
	
	if health.value == 0:
		print('dead');
	
	health.update_ui_bar()
	hunger.update_ui_bar()
	thirst.update_ui_bar()
func eat(amount):
	hunger.add(amount)

func drink(amount):
	thirst.add(amount)
