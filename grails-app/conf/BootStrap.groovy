import com.testapp.Role;
import com.testapp.User;
import com.testapp.UserRole;
import cumples.Empresa;

class BootStrap {

    def init = { servletContext ->
		
		
		//def role = new Role(authority:"ROLE_ADMIN").save(failOnError:true, flush:true)
		//def user = new User(username:"admin", password:"1234", empresa:"asdla").save(failOnError:true, flush:true)
		//UserRole.create(user, role, true)
		
		//def role2 = new Role(authority:"ROLE_SUPERADMIN").save(failOnError:true, flush:true)
		//def user2 = new User(username:"superadmin", password:"1234", empresa:"asdla").save(failOnError:true, flush:true)
		//UserRole.create(user2, role2, true)
		
		def emp1=new Empresa(nombre: "MercadoLibre", mail:"cande.cp@gmail.com").save(flush:true);
		def emp2=new Empresa(nombre: "OLX", mail:"ken.weinberg@mercadolibre.com").save(flush:true);
		def emp3=new Empresa(nombre: "alaMaula", mail:"candelaria.campos@mercadolibre.com").save(flush:true);
      }

    def destroy = {
    }
}
