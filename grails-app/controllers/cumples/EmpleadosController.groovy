package cumples  	
import cumples.Empleado
import java.util.Date
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
	def agregarEmpleado() {
		
			 def contenidoNombre = params.nombre
			 def contenidoApellido = params.apellido
			 def contenidoFecha = params.fecha
			 def miEmpleado = new Empleado (nombre: contenidoNombre, apellido:contenidoApellido, fechaNacimiento: Date.parse("yyyy/MM/dd",contenidoFecha))
		
		     miEmpleado.save()
			 redirect(controller: "Empleados", action:"index")
			 
			 }
}
