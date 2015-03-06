package cumples  	
import cumples.Empleado
import java.util.Date
import cumples.Regalo

class EmpleadosController {

    def index() {

    	[infoRegalos: Empleado.list().collect{
    		def hayRegalo = it.regalos.find{it.anioProducto == (new Date().getYear())};
    		[
    			id: it.id,
    			nombre: it.nombre,
    			apellido: it.apellido,	
    			fechaCumpleanios: it.obtenerFecha(),
    			regalo: hayRegalo
    		]
    	}

    	];
    }
    
    def regalo(long id) {
    	[idEmpleado: id];
    }
	
	def crearEmpleado() {}

	def agregarProducto() {
		Empleado miEmpleado = Empleado.get(params.idEmpleado as long);
		Regalo miRegalo = new Regalo(tituloProducto: params.nombreProducto ,urlFotoProducto: params.urlFotoProducto, anioProducto: new Date().getYear());
		//miRegalo.save(flush:true);
		miEmpleado.regalos.add(miRegalo);
		miEmpleado.save(flush:true);
		redirect(controller: "Empleados", action:"index");
	}	
	def agregarEmpleado() {
		
		def contenidoNombre = params.nombre
		def contenidoApellido = params.apellido
		def contenidoFecha = params.fecha
		def miEmpleado = new Empleado (nombre: contenidoNombre, apellido:contenidoApellido, fechaNacimiento: Date.parse("dd/MM/yyyy",contenidoFecha));	
	    miEmpleado.save(flush:true)
		redirect(controller: "Empleados", action:"index")			 
	}
}
