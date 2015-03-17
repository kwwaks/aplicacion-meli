package mail
import grails.transaction.Transactional
import cumples.Empleado
import cumples.Empresa
import java.util.List
import java.util.Date

@Transactional
class EnvioMailService {

    def mandarMail(Empresa empresa){
    	def empleados = empresa.empleados;
    	def gastosDelMes = 0;
		def mesActual = (new Date().month);
    	for (int i = 0; i < empleados.size(); i++) { 
			if (empleados[i].fechaNacimiento.month == mesActual) {
				def presente = empleados[i].regalos.find{it.fechaProducto.year == new Date().year};
				if(presente != null) {
					gastosDelMes = gastosDelMes + presente.precioProducto;
				}
				
			}
		}

		sendMail {
			to "cande.cp@gmail.com"
			subject "Gastos del mes de " + session[empresa].nombre
			body 'Se gastaron en regalos $' + gastosDelMes
		}


    }

}
