extends Node2D

#primero funcion los botones izquierdo y derecho
#codigo de prototipo finalizado 21/sep/19
#ultimo avance 28/feb/20
# :3
#de anubarak para quien lo necesite
#licencia MIT :D

var loDeLosTiles
var cosaDeCamara
var spriteActual = 0
var directorioAbierto = 0
var dialogo = 0
func _ready():
	loDeLosTiles = get_node("loDeLosTiles")
	cosaDeCamara = get_node("camara")
	#se toma un puntero al nodo hijo para mayor comodidad

#Si un input event no es respondido, se ejecuta este metodo
func _unhandled_input(event):
	if typeof(dialogo) != typeof(0):
		return
		
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

func presionadoGuardar():
	dialogo = FileDialog.new()
	dialogo.set_mode(dialogo.MODE_SAVE_FILE)
	dialogo.set_access(dialogo.ACCESS_USERDATA)
	dialogo.set_filters(PoolStringArray(["*.save"]))
	dialogo.set_current_dir("user://")
	$camara.add_child(dialogo)
	dialogo.popup_centered_clamped($camara.position)
	dialogo.connect("file_selected", self,"guardar")
	if typeof(directorioAbierto) != typeof(0):
		dialogo.set_current_path(directorioAbierto)

func guardar(path):
	dialogo = 0
	directorioAbierto = path
	var archivador = File.new()
	archivador.open(path, File.WRITE)
	archivador.store_var(loDeLosTiles, true)
	archivador.close()
	
func presionadoCargar():
	dialogo = FileDialog.new()
	dialogo.set_mode(dialogo.MODE_OPEN_FILE)
	dialogo.set_access(dialogo.ACCESS_USERDATA)
	dialogo.set_filters(PoolStringArray(["*.save"]))
	dialogo.set_current_dir("user://")
	$camara.add_child(dialogo)
	dialogo.popup_centered_clamped($camara.position)
	dialogo.connect("file_selected", self,"cargar")
	if typeof(directorioAbierto) != typeof(0):
		dialogo.set_current_path(directorioAbierto)

func cargar(path):
	dialogo = 0
	directorioAbierto = path
	var desarchivar = File.new()
	desarchivar.open(path, File.READ)
	loDeLosTiles.queue_free()
	loDeLosTiles = desarchivar.get_var(true);
	desarchivar.close()
	add_child(loDeLosTiles)

func salir():
	get_tree().quit()
