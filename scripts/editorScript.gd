extends Node2D

#primero funcion los botones izquierdo y derecho
#la escena debe tener mas controles, cambiando los tiles a colocar
#codigo de prototipo finalizado 21/sep/19
# :3
#de anubarak para quien lo necesite
#licencia MIT :D

var tileMap
func _ready():
	tileMap = $TileMap
	#se toma el nodo hijo para mayor comodidad

func _input(event):
	if(event is InputEventMouseButton):
		#toma las presiones del mouse
		if(event.button_index == BUTTON_LEFT and event.pressed):
			#en caso de presionar el boton izquierdo
			var tilePos = tileMap.world_to_map(event.position)
			#toma un vector(x,y) y lo traduce en coordenadas de malla
			tileMap.set_cellv(tilePos, 0)
			#cambia la celda de la posicion por el sprite 0
		
		if(event.button_index == BUTTON_RIGHT and event.pressed):
			#igual pero con el boton contrario
			var tilePos = tileMap.world_to_map(event.position)
			#exactamente lo mismo, pero la posicion cambiará
			tileMap.set_cellv(tilePos, -1)
			#un -1 va a eliminar el sprite en ese sitio de la malla
	