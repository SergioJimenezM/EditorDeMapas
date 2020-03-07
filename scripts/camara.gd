extends Camera2D

export var velocidadDeLaCamara = 10

func _process(delta):
	#Guarda un bit hacia la direccion del movimiento en eje X
	var moverX = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	#guarda un bit hacia la direccion del movimiento en eje Y
	var moverY = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	#Se necesita el delta * velocidad de movimiento dos veces en la formula
	#por tanto se aplica esta parte de la formula ahorrando un proceso
	var DeltaMultiplicado = velocidadDeLaCamara * delta
	
	#lerp es interpolacion lineal
	#consigue un valor perteneciente a la función asociada que estamos creando
	#la formula traza una recta entre dos valores y así se calcula el movimiento
	position.x = lerp(position.x, position.x - moverX * velocidadDeLaCamara, DeltaMultiplicado)
	position.y = lerp(position.y, position.y - moverY * velocidadDeLaCamara, DeltaMultiplicado)
