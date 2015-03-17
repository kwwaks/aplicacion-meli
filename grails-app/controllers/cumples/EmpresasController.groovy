package cumples
import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole;
import grails.plugin.springsecurity.annotation.*

class EmpresasController {
	
	@Secured(['ROLE_SUPERADMIN'])
    def newEmpresa() {
	}
	
	@Secured(['ROLE_SUPERADMIN'])
	def agregarEmpresa(){
		def nombre = params.nombreEmp;
		def mail= params.mailEmp;
		Empresa nueva = new Empresa(nombre: nombre, mail: mail);
		nueva.save(failOnError:true);
		redirect(action:"newEmpresa");
	}
	
	@Secured(['ROLE_SUPERADMIN'])
	def newAdmin() {
		[empresas:Empresa.list()];
	}
	
	@Secured(['ROLE_SUPERADMIN'])
	def agregarAdmin(){
		def user=params.user;
		def pass=params.pass;
		def empresa=Empresa.get(params.empresaID as long);
		User u1 = new User(username:user, password:pass).save(flush:true);
		Role r1 = new Role(authority:"ROLE_ADMIN"+empresa.nombre).save(flush:true);
		UserRole.create(u1, r1, true);
		redirect(action:"newAdmin");
	}
}
