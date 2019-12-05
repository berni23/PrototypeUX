extends Node2D

var Cst =Color(1,1,1,0)
var Cwrong = Color(0.87451, 0.078431,0.078431,0.435294)
var Cright =Color(0, 0.870588,0.070588, 0.305882)
var Cpressed = Color(0.090196,0.537255,0.670588,0.2)
var Cfinished = Color(1,1,1,1)
var pressed = 0
var paired = 0
var Bbefore = null
func Unpress(Node):
	pressed =0
	for node in Node.get_children():
		node.pressed = false	
func _on_buttonBack_pressed():
	for node in get_node('Control').get_children():
		node.hide()
	for node in get_node('Control2').get_children():
		node.hide()

func _on_TouchScreenButton_pressed():
		$Control.show()
		get_node("Control/Sprite2").show()
func _on_Button2_pressed():
		get_node("Control/Sprite2").hide()
		get_node("Control/Sprite3").show()
func _on_Button3_pressed():
		get_node("Control/Sprite3").hide()
		if $Control/Sprite3/HSlider.value==0:
			get_node("Control/Sprite4").show()
		else: return
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
	print('is wrong')
	for node in $Control/Sprite8.get_children():
		if node.pressed==true:
			 node.modulate = Cwrong
			 print('sure it is')
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
		$Sprite9.show()
