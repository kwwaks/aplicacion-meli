package cumples
import cumples.Empleado
import java.util.List
import java.util.Date

class EnvioMailsController {

	def index() {
		
	}

    def mandarMail() {

    	def empleados = Empleado.list();
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
			to params.mail
			subject "Gastos del mes "
			body 'Se gastaron en regalos $' + gastosDelMes
	  }
		redirect(controller: "Empleados", action:"index");
    }

}