package cumples  	
import cumples.Empleado
import java.util.Date
import cumples.Regalo
import cumples.Extras
import empleados.EmpleadoService
import regalos.RegaloService
import grails.plugin.springsecurity.annotation.*

@Secured(['ROLE_ADMIN'])

class EmpleadosController {

	def empleadoService;
	def regaloService;

    def index() {
        [infoRegalos: empleadoService.listarCumplesDelDia()];
    }
    
    def regalo(long id) {
    	[idEmpleado: id];
    }

    def cancelar(long id){
		Empleado miEmpleado = Empleado.get(id);
		regaloService.cancelarRegalo(miEmpleado);
		redirect(controller: "Empleados", action:"index");
    }

    def eliminarEmpleado(long id){
		Empleado miEmpleado = Empleado.get(id);
		empleadoService.eliminar(miEmpleado);
		redirect(controller: "Empleados", action:"index");
    }
	
	def crearEmpleado() {}

	def buscarEmpleado() {
		[listaEmpleados: Empleado.list()];
	}

	def agregarProducto() {
		Empleado miEmpleado = Empleado.get(params.idEmpleado as long);
		Regalo miRegalo = new Regalo(tituloProducto: params.nombreProducto ,urlFotoProducto: params.urlFotoProducto, fechaProducto: new Date(), precioProducto: params.precioProducto);
		regaloService.agregar(miEmpleado, miRegalo);
		redirect(controller: "Empleados", action:"index");
	}	

	def agregarEmpleado() {
		def contenidoNombre = params.nombre;
		def contenidoApellido = params.apellido;
		def contenidoFecha = params.fecha;
		empleadoService.agregar(contenidoNombre, contenidoApellido, contenidoFecha); 
		redirect(controller: "Empleados", action:"index");
	}

}