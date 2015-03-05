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

	def agregarProducto() {
		Empleado miEmpleado = Empleado.get(params.idEmpleado as long);
		miEmpleado.nombreProducto = params.nombreProducto;
		miEmpleado.urlFotoProducto = params.urlFotoProducto;
		miEmpleado.save(flush:true);
		redirect(controller: "Empleados", action:"index");
	}
}
