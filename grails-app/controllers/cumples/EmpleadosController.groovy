package cumples  	
import cumples.Empleado
import java.util.Date
import cumples.Regalo
import cumples.Extras

class EmpleadosController {

    def index() {

    	def cumlesDelDia = Empleado.list().collect{
    		def hayRegalo = it.regalos.find{
    			it.fechaProducto.year == (new Date().year);
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
		Regalo miRegalo = miEmpleado.regalos.find{it.fechaProducto.year == new Date().year};
		miEmpleado.regalos.remove(miRegalo);
		miRegalo.delete(flush:true);
		miEmpleado.save(flush:true);
		redirect(controller: "Empleados", action:"index");
    }

    def eliminarEmpleado(long id){
		Empleado miEmpleado = Empleado.get(id);
		for (int i = 0; i < miEmpleado.regalos.size(); i++){
			Regalo miRegalo = miEmpleado.regalos[i];
			miEmpleado.regalos.remove(miRegalo);
			miRegalo.delete(flush:true);
		}
		miEmpleado.delete(flush:true);
		redirect(controller: "Empleados", action:"index");
    }
	
	def crearEmpleado() {}

	def buscarEmpleado() {
		[listaEmpleados: Empleado.list()];
	}

	def agregarProducto() {
		Empleado miEmpleado = Empleado.get(params.idEmpleado as long);
		Regalo miRegalo = new Regalo(tituloProducto: params.nombreProducto ,urlFotoProducto: params.urlFotoProducto, fechaProducto: new Date(), precioProducto: params.precioProducto);
		def presente = miEmpleado.regalos.find{it.fechaProducto.year == new Date().year};
		if(presente != null){
			miEmpleado.regalos.remove(presente);
			presente.delete(flush:true);
		}
		miRegalo.save(flush:true);
		miEmpleado.regalos.add(miRegalo);
		miEmpleado.save(flush:true);
		redirect(controller: "Empleados", action:"index");
	}	
	def agregarEmpleado() {
		def contenidoNombre = params.nombre;
		def contenidoApellido = params.apellido;
		def contenidoFecha = params.fecha;
		def miEmpleado = new Empleado (nombre: contenidoNombre, apellido:contenidoApellido, fechaNacimiento: Date.parse("yyyy-MM-dd",contenidoFecha));
		miEmpleado.save(flush:true);
		redirect(controller: "Empleados", action:"index");
	}
}
