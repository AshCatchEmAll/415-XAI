extends CanvasLayer

var map_scene = preload("res://GameOne/scenes/map.tscn")


func change_scene_to_file(target: String):
	var Player = get_node("AnimationPlayer")
	Player.play('dissolve')
	await Player.animation_finished
	get_tree().change_scene_to_file(target)
	Player.play_backwards('dissolve')
	return


func change_to_map_scene(params={} ):
	var Player = get_node("AnimationPlayer")
	Player.play('dissolve')
	await Player.animation_finished
	
	var map_instance = map_scene.instantiate()
	for param in params:
		map_instance.set(param, params[param])
	get_tree().get_root().add_child(map_instance)
	get_tree().current_scene.free()
	get_tree().current_scene = map_instance
	Player.play_backwards('dissolve')

	return
