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

    def index(String empresa){
		session["empresa"]=Empresa.findByNombre(empresa);
		[infoRegalos: empleadoService.listarCumplesDelDia(session["empresa"]), empresa:session["empresa"]];
    }
	
	def home() {
		[listaEmpresas: Empresa.list()]
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
		redirect(action:"index");
    }

	@Secured(['ROLE_ADMIN'])
    def eliminarEmpleado(long id){
		Empleado miEmpleado = Empleado.get(id);
		empleadoService.eliminar(miEmpleado);
		redirect(action:"index");
    }
	
	def crearEmpleado() {}

	def buscarEmpleado() {
		[listaEmpleados: Empleado.findAllByEmpresa(session["empresa"])];
	}

	@Secured(['ROLE_ADMIN'])
	def agregarProducto() {
		Empleado miEmpleado = Empleado.get(params.idEmpleado as long);
		Regalo miRegalo = new Regalo(tituloProducto: params.nombreProducto ,urlFotoProducto: params.urlFotoProducto, fechaProducto: new Date(), precioProducto: params.precioProducto);
		regaloService.agregar(miEmpleado, miRegalo);
		redirect(action:"index");
	}	

	@Secured(['ROLE_ADMIN'])
	def agregarEmpleado() {
		def contenidoNombre = params.nombre;
		def contenidoApellido = params.apellido;
		def contenidoFecha = params.fecha;
		def contenidoEmpresa = session["empresa"];
		empleadoService.agregar(contenidoNombre, contenidoApellido, contenidoFecha, contenidoEmpresa); 
		//flash.message = session["empresa"].nombre;
		redirect(url:"/cumples-de-hoy/"+session["empresa"].nombre+"");
	}

}