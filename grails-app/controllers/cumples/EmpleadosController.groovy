package cumples  	
import cumples.Empleado
import java.util.Date
import cumples.Regalo
import cumples.Extras
import empleados.EmpleadoService
import regalos.RegaloService
import grails.plugin.springsecurity.annotation.*

class EmpleadosController {

	def empleadoService;
	def regaloService;

    def index(){
        [infoRegalos: empleadoService.listarCumplesDelDia(session["empresa"]), empresa:session["empresa"]];
		
    }
	
	def sessionEmpresa(){
		session["empresa"]=Empresa.get(params.empresaID as long);
		redirect(action:"index");
	}
	
	@Secured(['ROLE_ADMIN'])
    def regalo(long id) {
    	[idEmpleado: id];
    }

	@Secured(['ROLE_ADMIN'])
    def cancelar(long id){
		Empleado miEmpleado = Empleado.get(id);
		regaloService.cancelarRegalo(miEmpleado);
		redirect(controller: "Empleados", action:"index");
    }

	@Secured(['ROLE_ADMIN'])
    def eliminarEmpleado(long id){
		Empleado miEmpleado = Empleado.get(id);
		empleadoService.eliminar(miEmpleado);
		redirect(controller: "Empleados", action:"index");
    }
	
	@Secured(['ROLE_ADMIN'])
	def crearEmpleado() {}

	def buscarEmpleado() {
		[listaEmpleados: Empleado.list()];
	}

	@Secured(['ROLE_ADMIN'])
	def agregarProducto() {
		Empleado miEmpleado = Empleado.get(params.idEmpleado as long);
		Regalo miRegalo = new Regalo(tituloProducto: params.nombreProducto ,urlFotoProducto: params.urlFotoProducto, fechaProducto: new Date(), precioProducto: params.precioProducto);
		regaloService.agregar(miEmpleado, miRegalo);
		redirect(controller: "Empleados", action:"index");
	}	

	@Secured(['ROLE_ADMIN'])
	def agregarEmpleado() {
		def contenidoNombre = params.nombre;
		def contenidoApellido = params.apellido;
		def contenidoFecha = params.fecha;
		def contenidoEmpresa = session["empresa"];
		empleadoService.agregar(contenidoNombre, contenidoApellido, contenidoFecha, contenidoEmpresa); 
		redirect(controller: "Empleados", action:"index");
	}

}