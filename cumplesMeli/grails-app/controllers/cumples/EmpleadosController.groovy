package cumples  	
import cumples.Empleado

class EmpleadosController {

    def index() {
    	[listaEmpleados: Empleado.list()];
     }
    
    def regalo(long id) {
    	[idEmpleado: id];
    }
	
	def crearEmpleado() {}
}
