extends "res://Scenes/Enemeys/Enemy.gd"
var og_size = 75
var og_size2

func _on_area_2d_2_body_entered(body):
	if !body.is_in_group('paddles'):
		body.queue_free()
		$Shield.start()
		$Area2D2/Sprite2D.position.y = 5000
		$Area2D2/CollisionShape2D.position.y = 5000
 
func _ready():
	for n in range(global.player_items_index.size()):
		if(global.player_items_index[n] == 1):
			fire_damage *= 2
	get_tree().get_first_node_in_group("enemy_health").clear()
	get_tree().get_first_node_in_group("enemy_health").append_text("[center]" + str(ceil(hp)) + " HP[/center]")
	size = $CollisionShape2D.shape.size
	og_size = $Area2D2/CollisionShape2D.shape.size.y
	og_size2 = $Area2D2/Sprite2D.scale
	speed = 150
	resistance = 25

func shoot():
	if(can_shoot): 
		get_tree().get_first_node_in_group("world").spawn_ball(position.x - $Area2D/CollisionShape2D.shape.size.x/2 - global.ball_size.x - 20, position.y, -1 , randf_range(min_degrees, max_degrees),damage)
		$Timer.wait_time = fire_rate.pick_random()
		$Timer.start()

func _on_shield_timeout():
	$Area2D2/Sprite2D.position.y = $CollisionShape2D.position.y
	$Area2D2/CollisionShape2D.position.y = $CollisionShape2D.position.y

