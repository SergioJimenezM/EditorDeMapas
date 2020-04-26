extends Camera2D

export var velocidadDeLaCamara = 15

func _process(delta):
	#Guarda un bit hacia la direccion del movimiento en eje X
	var moverX = int(Input.is_action_pressed("ui_left")) - int(Input.is_action_pressed("ui_right"))
	#guarda un bit hacia la direccion del movimiento en eje Y
	var moverY = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	#Se necesita el delta * velocidad de movimiento dos veces en la formula
	#por tanto se aplica esta parte de la formula ahorrando un proceso
	var DeltaMultiplicado = velocidadDeLaCamara * delta
	position.x = lerp(position.x, position.x - moverX * velocidadDeLaCamara, DeltaMultiplicado)
	position.y = lerp(position.y, position.y - moverY * velocidadDeLaCamara, DeltaMultiplicado)
	#lerp es interpolacion lineal
	#consigue un valor perteneciente a la función asociada que estamos creando
	#la formula traza una recta entre dos valores y así se calcula el movimiento
#	if position.x <= 1000 and position.x >= -1000:
#		position.x = lerp(position.x, position.x - moverX * velocidadDeLaCamara, DeltaMultiplicado)
#	else:
#		position.x = position.x + 10 + (-1 * moverX) #rebote por limite del mapa
	
#	if position.y <= 1000 and position.y >= -1000:
#		position.y = lerp(position.y, position.y - moverY * velocidadDeLaCamara, DeltaMultiplicado)
#	else:
#		position.y = position.y + 10 +(-1 * moverY) #rebote por limite del mapa y invertir signo
