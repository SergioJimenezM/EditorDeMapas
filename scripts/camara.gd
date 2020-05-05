extends Camera2D

export var velocidadDeLaCamara = 15

func _process(delta):
	var posicion =  get_global_position()
	var botonera = $botonera.get_global_position()
	#Guarda un bit hacia la direccion del movimiento en eje X
	var moverX = int(Input.is_action_pressed("ui_left")) - int(Input.is_action_pressed("ui_right"))
	#guarda un bit hacia la direccion del movimiento en eje Y
	var moverY = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	#Se necesita el delta * velocidad de movimiento dos veces en la formula
	#por tanto se aplica esta parte de la formula ahorrando un proceso
	var DeltaMultiplicado = velocidadDeLaCamara * delta
	posicion.x = lerp(posicion.x, posicion.x - moverX * velocidadDeLaCamara, DeltaMultiplicado)
	posicion.y = lerp(posicion.y, posicion.y - moverY * velocidadDeLaCamara, DeltaMultiplicado)
	#lerp es interpolacion lineal
	#consigue un valor perteneciente a la función asociada que estamos creando
	#la formula traza una recta entre dos valores y así se calcula el movimiento
	print($botonera.get_global_position())
	#tomar la botonera y fijarla en posiciones relativas a estas
	if posicion.x >= 680:#No son 1200 reales
		posicion.x = posicion.x - 10
	if posicion.x <= -685:
		posicion.x = posicion.x + 10
	if posicion.y >= 900:
		posicion.y = posicion.y - 10
	if posicion.y <= -900:
		posicion.y = posicion.y + 10
	botonera.x = (posicion.x - 525)
	botonera.y = (posicion.y - 290)
	$botonera.set_global_position(botonera)#hay que alterar esta posicion
	set_global_position(posicion)
	
