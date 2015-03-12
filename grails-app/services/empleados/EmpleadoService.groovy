package empleados
import cumples.Empleado
import java.util.Date
import cumples.Regalo
import cumples.Extras
import grails.transaction.Transactional

@Transactional
class EmpleadoService {

	//Si ya existe un empleado con mismo nombre, apellido y fecha de nacimiento, no se agrega (se considera el mismo)
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

	//listado para la vista del home
	def listarCumplesDelDia(){
      
        def cumplesDelDia = Empleado.list().findAll{ //Todos los empleados que cumplen hoy
            Extras.obtenerFecha(it.fechaNacimiento) == Extras.obtenerFecha(new Date());
        };

        cumplesDelDia = cumplesDelDia.collect{

            def hayRegalo = it.regalos.find{it.fechaProducto.year == (new Date().year)}; //solo muestro el regalo de este año (si hay, sino null)
            //armo un json del empleado (para la vista)
            [
                id: it.id,
                nombre: it.nombre,
                apellido: it.apellido,  
                fechaCumpleanios: Extras.obtenerFecha(it.fechaNacimiento),
                regalo: hayRegalo
            ]    

        };
        return cumplesDelDia;
	}

}
