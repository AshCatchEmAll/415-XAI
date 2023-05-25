extends CanvasLayer


func change_scene_to_file(target: String):
	var Player = get_node("AnimationPlayer")
	Player.play('dissolve')
	await Player.animation_finished
	get_tree().change_scene_to_file(target)
	Player.play_backwards('dissolve')
	return
