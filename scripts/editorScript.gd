extends Node2D

#primero funcion los botones izquierdo y derecho
#codigo de prototipo finalizado 21/sep/19
#ultimo avance 28/feb/20
# :3
#de anubarak para quien lo necesite
#licencia MIT :D

var loDeLosTiles
var spriteActual = 0

func _ready():
	loDeLosTiles = get_node("loDeLosTiles")
	#se toma un puntero al nodo hijo para mayor comodidad

#Si un input event no es respondido, se ejecuta este metodo
func _unhandled_input(event):
	if(event is InputEventMouseButton and event.is_pressed()):
		if(event.button_index == BUTTON_WHEEL_UP or event.button_index == BUTTON_WHEEL_DOWN):
			if(spriteActual == 0):
				spriteActual = 1
			else:
				spriteActual = 0
		if(event.button_index == BUTTON_LEFT and event.pressed):
			#en caso de presionar el boton izquierdo
			var tilePos = loDeLosTiles.world_to_map(get_global_mouse_position())
			#toma un vector(x,y) y lo traduce en coordenadas de malla
			loDeLosTiles.set_cellv(tilePos, spriteActual)
			#cambia la celda de la posicion por el sprite(0:yerba 1:tierra)
		if(event.button_index == BUTTON_RIGHT and event.pressed):
			#igual pero con el boton contrario
			var tilePos = loDeLosTiles.world_to_map(get_global_mouse_position())
			#exactamente lo mismo, pero la posicion cambiará
			loDeLosTiles.set_cellv(tilePos, -1)
			#un -1 va a eliminar el sprite en ese sitio de la malla

func guardar():
#	var archivador = File.new()
	var archivo = FileDialog.new()
	archivo.set_current_dir("user://")
	$camara.add_child(archivo)
	
#	archivador.open("user://juegoGuardado.save", File.WRITE)
#	archivador.store_var(loDeLosTiles, true)
#	archivador.close()

func cargar():
	var desarchivar = File.new()
	desarchivar.open("user://juegoGuardado.save", File.READ)
	loDeLosTiles.queue_free()
	loDeLosTiles = desarchivar.get_var(true);
	desarchivar.close()
	add_child(loDeLosTiles)
	
func salir():
	get_tree().quit()
