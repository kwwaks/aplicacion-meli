import com.testapp.Role;
import com.testapp.User;
import com.testapp.UserRole;
import cumples.Empleado;
import cumples.Empresa
import cumples.Regalo;
import java.util.Date;

class BootStrap {

    def init = { servletContext ->
		
		
		def role = new Role(authority:"ROLE_ADMIN").save(flush:true)
		def user = new User(username:"candeKen", password:"123").save(flush:true)
		UserRole.create(user, role, true)
		
		//def emp1=new Empresa(nombre: "MercadoLibre", mail:"cande.cp@gmail.com").save(flush:true);
		//def emp2=new Empresa(nombre: "OLX", mail:"ken.weinberg@mercadolibre.com").save(flush:true);
		//def emp3=new Empresa(nombre: "alaMaula", mail:"candelaria.campos@mercadolibre.com").save(flush:true);
      }

    def destroy = {
    }
}
