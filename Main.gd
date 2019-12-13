extends Node2D
var Cst =Color(1,1,1,0)
var Cwrong = Color(0.87451, 0.078431,0.078431,0.435294)
var Cright =Color(0, 0.870588,0.070588, 0.305882)
var Cpressed = Color(0.090196,0.537255,0.670588,0.2)
var Cfinished = Color(1,1,1,1)
var pressed = 0
var paired = 0
var Char=0
var Screen = 0
var message = 'Hey'
var a=1


        
func _ready():
			for node in get_node('Control').get_children():node.hide()
			for node in get_node('Control2').get_children():node.hide()

func Unpress(Node):
	pressed =0
	for node in Node.get_children():
		node.pressed = false
func _on_buttonBack_pressed():
	if Screen==0:for node in get_node('Control').get_children():node.hide()	
	else: 
		for node in get_node('Control2').get_children():node.hide()
		$Control/Sprite9.show()
		Screen=0
		
#func _on_ButtonBack17_pressed():
#	for node in get_node('Control2').get_children():node.hide()
#	Screen =0
#	$Sprite.show()
#	$Control/Sprite9.show()
#

func _on_TouchScreenButton_pressed():
		$Control.show()
		get_node("Control/Sprite2").show()	
func _on_ButtonGerman_pressed():
	   $Control/Sprite9.show()

func _on_Button2_pressed():
		get_node("Control/Sprite2").hide()
		get_node("Control/Sprite3").show()
func _on_Button3_pressed():
		get_node("Control/Sprite3").hide()
		if $Control/Sprite3/HSlider.value==0:
			get_node("Control/Sprite4").show()
		else: $Sprite9.show()
func _on_Button4_pressed():
	get_node("Control/Sprite4").hide()
	get_node("Control/Sprite5").show()
func _on_Button5_pressed():
	get_node("Control/Sprite5").hide()
	get_node("Control/Sprite6").show()
func _on_Button6_pressed():
	get_node("Control/Sprite6").hide()
	get_node("Control/Sprite7").show()
func _on_Button7_pressed():
	get_node("Control/Sprite7").hide()
	get_node("Control/Sprite8").show()
func _on_Button8_1_pressed():
	if pressed==0: $Control/Sprite8/Button8_1.modulate=Cpressed
	elif $Control/Sprite8/Button8_2.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_2_pressed():
	if pressed==0: $Control/Sprite8/Button8_2.modulate=Cpressed
	elif $Control/Sprite8/Button8_1.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_3_pressed():
	if pressed==0: $Control/Sprite8/Button8_3.modulate=Cpressed
	elif $Control/Sprite8/Button8_4.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_4_pressed():
	if pressed==0: $Control/Sprite8/Button8_4.modulate=Cpressed
	elif $Control/Sprite8/Button8_3.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_5_pressed():
	if pressed==0: $Control/Sprite8/Button8_5.modulate=Cpressed
	elif $Control/Sprite8/Button8_6.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_6_pressed():
	if pressed==0: $Control/Sprite8/Button8_6.modulate=Cpressed
	elif $Control/Sprite8/Button8_5.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_7_pressed():
	if pressed==0: $Control/Sprite8/Button8_7.modulate=Cpressed
	elif $Control/Sprite8/Button8_8.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_8_pressed():
	if pressed==0: $Control/Sprite8/Button8_8.modulate=Cpressed
	elif $Control/Sprite8/Button8_7.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_9_pressed():
	if pressed==0: $Control/Sprite8/Button8_9.modulate=Cpressed
	elif $Control/Sprite8/Button8_10.pressed==true: right8()
	else: wrong8()
	pressed+=1
func _on_Button8_10_pressed():
	if pressed==0: $Control/Sprite8/Button8_10.modulate=Cpressed
	elif $Control/Sprite8/Button8_9.pressed==true: right8()
	else: wrong8()
	pressed+=1
func right8():
	for node in $Control/Sprite8.get_children():
		if node.pressed ==true: node.modulate = Cright
	$Correct8.play()
	Unpress($Control/Sprite8)
func wrong8():
	for node in $Control/Sprite8.get_children():
		if node.pressed==true:
			 node.modulate = Cwrong
	$Wrong8.play()
	Unpress($Control/Sprite8)
func _on_Wrong8_finished():
	Unpress($Control/Sprite8)
	for node in $Control/Sprite8.get_children():
		if node.modulate==Cwrong:
			node.modulate=Cst	
func _on_Correct8_finished():
	Unpress($Control/Sprite8)
	paired+=1
	for node in $Control/Sprite8.get_children():
		if node.modulate==Cright:
			node.modulate=Cfinished
			#IN the future, set a text on the button and just hide it()
	if paired>=5:
		paired =0
		$Control/Sprite8.hide()
		$Control/Sprite8b.show()
		$Timer8.start()
		$Timer8b.start()
		$Keyboard.play()
func _on_Timer8_timeout():
	$Control/Sprite8b.hide()
	$Control/Sprite8b/Label8b.visible_characters=0
	$Control/Sprite8b/Label8b_2.visible_characters=0
	$Timer8b.stop()
	$Keyboard.stop()
	$Control/Sprite9.show()
func _on_Timer8b_timeout():
	Char+=1
	if Char<=33: $Control/Sprite8b/Label8b.visible_characters=Char
	else: $Control/Sprite8b/Label8b_2.visible_characters=Char-33
	if Char>68: $Keyboard.stop()
func _on_Button9_1_pressed():
	Screen =1
	$Control2/Sprite17.show()
	$Timer17.start()
	#for node in get_node('Control').get_children():node.hide()
func _on_Button9_2_pressed():
	Screen = 1
	$Control2/Sprite10.show()
func _on_Button10_pressed():
	$Control2/Sprite11.show()	
func _on_Timer17_timeout():
	#$Control2/Sprite17.hide()
	$Control2/Sprite18.show()
	$Timer18.start()
func _on_Timer18_timeout():
	$Control2/Sprite19.show()
func _on_Button19_pressed():
	$Control2/Sprite20.show()
func _on_Button9_4_pressed():
	Screen=1
	$Control2/Sprite21.show()
func _on_Button21_1_pressed():
	#$Control2/Sprite21.hide()
	$Control2/Sprite23.show()
	$Timer23.start()
func _on_Button21_2_pressed():
	$Control2/Sprite22.show()
func _on_Timer23_timeout():
	$Control2/Sprite24.show()
	$Timer24.start()
func _on_Timer24_timeout():
	$Control2/Sprite25.show()
func _input(event):
	if $Control2/Sprite25.is_visible():
		if Input.is_key_pressed(KEY_ENTER):
			if $Control2/Sprite25/TextEdit.text=='Die Uhr':
				$Control2/Sprite25/TextEdit.modulate=Cright
				$Correct25.play()
			else:
				$Wrong25.play()
				$Control2/Sprite25/TextEdit.text=''
		
	elif $Control2/Sprite22.is_visible():
		if Input.is_key_pressed(KEY_ENTER):
			if $Control2/Sprite22/TextEdit.text=='Das Auto':
				$Control2/Sprite22/TextEdit.modulate=Cright
				$Correct22.play()
			else:
				$Wrong22.play()
				$Control2/Sprite22/TextEdit.text=''

func _on_Button9_3_pressed():
	Screen =1
	$Control2/Sprite12A.show()
func _on_Button12A1_pressed():
	$Control2/Sprite12.show()
func _on_Button12A2_pressed():
	$Control2/Sprite14.show()
	$Timer14.start()
func _on_Button12_pressed():
	$Control2/Sprite12.hide()
	$Control2/Sprite13.show()
func _on_Timer14_timeout():
	$Control2/Sprite15.show()
func _on_Button15_pressed():
	$Control2/Sprite16.show()

