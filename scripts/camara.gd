extends Camera2D

export var velocidadDeLaCamara = 10
export var limitesDeLaCamara = Vector2(200, 200)

func _process(delta):
	var moverX = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var moverY = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	var DeltaMultiplicado = velocidadDeLaCamara * delta
	
	position.x = lerp(position.x, position.x - moverX * velocidadDeLaCamara, DeltaMultiplicado)
	position.y = lerp(position.y, position.y - moverY * velocidadDeLaCamara, DeltaMultiplicado)
