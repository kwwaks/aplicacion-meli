package cumples  	
import cumples.Empleado
import java.util.Date
import cumples.Regalo
import cumples.Extras

class EmpleadosController {

    def index() {

    	def cumlesDelDia = Empleado.list().collect{
    		def hayRegalo = it.regalos.find{
    			it.anioProducto == (new Date().year);
    			};
    		[
    			id: it.id,
    			nombre: it.nombre,
    			apellido: it.apellido,	
    			fechaCumpleanios: Extras.obtenerFecha(it.fechaNacimiento),
    			regalo: hayRegalo
    		]
    	}

    	[infoRegalos: cumlesDelDia.findAll{
    		it.fechaCumpleanios == Extras.obtenerFecha(new Date());
    		}
    	];
    		
    	
    }
    
    def regalo(long id) {
    	[idEmpleado: id];
    }

    def cancelar(long id){
		Empleado miEmpleado = Empleado.get(id);
		Regalo miRegalo = miEmpleado.regalos.find{it.anioProducto == new Date().year};
		miEmpleado.regalos.remove(miRegalo);
		miEmpleado.save(flush:true);
		redirect(controller: "Empleados", action:"index");
    }
	
	def crearEmpleado() {}

	def buscarEmpleado() {}

	def agregarProducto() {
		Empleado miEmpleado = Empleado.get(params.idEmpleado as long);
		Regalo miRegalo = new Regalo(tituloProducto: params.nombreProducto ,urlFotoProducto: params.urlFotoProducto, anioProducto: new Date().year);
		def presente = miEmpleado.regalos.find{it.anioProducto == new Date().year};
		if(presente != null){
			miEmpleado.regalos.remove(presente);
		}
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
