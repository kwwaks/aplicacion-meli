package mail
import grails.transaction.Transactional
import cumples.Empleado
import cumples.Empresa
import java.util.List
import java.util.Date

@Transactional
class EnvioMailService {

    def mandarMail(Empresa empresa){
    	def empleadosDe = Empleado.findAllByEmpresa(empresa);
    	def gastosDelMes = 0;
		def mesActual = (new Date().month);
    	for (int i = 0; i < empleadosDe.size(); i++) { 
			if (empleadosDe[i].fechaNacimiento.month == mesActual) {
				def presente = empleadosDe[i].regalos.find{it.fechaProducto.year == new Date().year};
				if(presente != null) {
					gastosDelMes = gastosDelMes + presente.precioProducto;
				}
				
			}
		}

		sendMail {
			to "cande.cp@gmail.com"
			subject "Gastos del mes de " 
			body 'Se gastaron en regalos $' + gastosDelMes
		}


    }

}
