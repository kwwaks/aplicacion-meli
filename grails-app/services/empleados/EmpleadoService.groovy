package empleados
import cumples.Empleado
import java.util.Date
import cumples.Regalo
import cumples.Extras
import grails.transaction.Transactional

@Transactional
class EmpleadoService {

	def agregar(contenidoNombre, contenidoApellido, contenidoFecha){
		def existeEmpleado = Empleado.list().find{
			(it.nombre == contenidoNombre) &&
			(it.apellido == contenidoApellido) && 
			(it.fechaNacimiento == Date.parse("yyyy-MM-dd",contenidoFecha));
		};
		if( existeEmpleado == null){
			def miEmpleado = new Empleado (nombre: contenidoNombre, apellido:contenidoApellido, fechaNacimiento: Date.parse("yyyy-MM-dd",contenidoFecha));
			miEmpleado.save(flush:true);
		}

	}

	def eliminar(miEmpleado){
		for (int i = 0; i < miEmpleado.regalos.size(); i++){
			Regalo miRegalo = miEmpleado.regalos[i];
			miEmpleado.regalos.remove(miRegalo);
			miRegalo.delete(flush:true);
		}
		miEmpleado.delete(flush:true);
	}

	

}
