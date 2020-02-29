extends Node2D

#primero funcion los botones izquierdo y derecho
#la escena debe tener mas controles, cambiando los tiles a colocar
#codigo de prototipo finalizado 21/sep/19
# :3
#de anubarak para quien lo necesite
#licencia MIT :D

var loDeLosTiles

func _ready():
	loDeLosTiles = get_node("loDeLosTiles")
	#se toma un puntero al nodo hijo para mayor comodidad

func _input(event):
	if(event is InputEventMouseButton and event.is_pressed()):
		#toma las presiones del mouse despues de el punto 130
		#esto por que no quiero estorbarle a los botones
		
		#¿ahora como carajos muevo la camara con la posicion del mouse
		#sin romper ese limite arbitrario?
		if(event.position.x > 130):
			if(event.button_index == BUTTON_LEFT and event.pressed):
				#en caso de presionar el boton izquierdo
				var tilePos = loDeLosTiles.world_to_map(event.position)
				#toma un vector(x,y) y lo traduce en coordenadas de malla
				loDeLosTiles.set_cellv(tilePos, 0)
				#cambia la celda de la posicion por el sprite 0
			if(event.button_index == BUTTON_RIGHT and event.pressed):
				#igual pero con el boton contrario
				var tilePos = loDeLosTiles.world_to_map(event.position)
				#exactamente lo mismo, pero la posicion cambiará
				loDeLosTiles.set_cellv(tilePos, -1)
				#un -1 va a eliminar el sprite en ese sitio de la malla

func guardar():
	var archivador = File.new()
	archivador.open("user://juegoGuardado.save", File.WRITE)
	archivador.store_var(loDeLosTiles, true)
	archivador.close()

func cargar():
	var desarchivar = File.new()
	desarchivar.open("user://juegoGuardado.save", File.READ)
	loDeLosTiles.queue_free()
	loDeLosTiles = desarchivar.get_var(true);
	print(loDeLosTiles.get_name())
	desarchivar.close()
	add_child(loDeLosTiles)
