package cumples
import cumples.Empleado
import java.util.List

class EnvioMailsController {

    def index() {

    	def empleados = Empleado.list();
    	def gastosDelMes = 0;
		def mesActual = (new Date().getMonth()+1);

    	for (int i = 0; i < empleados.size(); i++) {
			if (empleados[i].fechaNacimiento.getMonth() == mesActual) {
				def presente = empleados[i].regalos.find{it.anioProducto == new Date().year};
				if(presente != null) {
					gastosDelMes = gastosDelMes + presente.precioProducto;
				}
				
			}
		}

		sendMail {
			to "lucasrossi20@gmail.com"
			subject "Gastos del mes "
			body 'Se gastaron en regalos'
	  }
    }

}