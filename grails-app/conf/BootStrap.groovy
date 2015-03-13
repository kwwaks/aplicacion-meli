import com.testapp.Role;
import com.testapp.User;
import com.testapp.UserRole;
import cumples.Empleado;
import cumples.Regalo;
import java.util.Date;

class BootStrap {

    def init = { servletContext ->
		
		
		def role = new Role(authority:"ROLE_ADMIN").save(flush:true)
		def user = new User(username:"candeKen", password:"123").save(flush:true)
		UserRole.create(user, role, true)
      }

    def destroy = {
    }
}
