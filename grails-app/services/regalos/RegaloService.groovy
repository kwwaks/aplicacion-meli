package regalos
import cumples.Empleado
import java.util.Date
import cumples.Regalo
import cumples.Extras
import grails.transaction.Transactional

@Transactional
class RegaloService {

	def agregar(Empleado miEmpleado, Regalo miRegalo){
		def presente = miEmpleado.regalos.find{it.fechaProducto.year == new Date().year};
		if(presente != null){
			miEmpleado.regalos.remove(presente);
			presente.delete(flush:true);
		}
		miRegalo.save(flush:true);
		miEmpleado.addToRegalos(miRegalo);
		miEmpleado.save(flush:true);
	}

	def cancelarRegalo(miEmpleado){
		Regalo miRegalo = miEmpleado.regalos.find{it.fechaProducto.year == new Date().year};
		miEmpleado.regalos.remove(miRegalo);
		miRegalo.delete(flush:true);
		miEmpleado.save(flush:true);
	}

}
