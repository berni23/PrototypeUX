extends Node2D

func _ready():
	pass
	#$Sprite2.position = $Sprite.position
	#set_viewport().size =
	#get_tree().get_root().size =Vector2(1024,1000)
func _on_buttonBack_pressed():
	for node in get_node('Control').get_children():
		node.hide()
		
func _on_TouchScreenButton_pressed():
		$Control.show()
		get_node("Control/Sprite2").show()
	
func _on_Button2_pressed():
		get_node("Control/Sprite2").hide()
		get_node("Control/Sprite3").show()


func _on_Button3_pressed():
		get_node("Control/Sprite3").hide()
		if $Control/Sprite3/HSlider.value ==1:
			get_node("Control/Sprite4").show()
		else: 
			return
