extends RichTextLabel

var lapsed = 0

func _ready():
	visible_characters = 0
	lapsed = 0

func _physics_process(_delta):
	var Label1 = get_parent().get_node('RichTextLabel')
	if Label1.visible_characters == Label1.get_total_character_count() :
		var Label2 = get_parent().get_node('RichTextLabel2')
		visible_characters = Label2.get_total_character_count()
