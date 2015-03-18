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
		if (User.findByUsername(params.user)==null){
			def user=params.user;
			def pass=params.pass;
			def empresa=Empresa.get(params.empresaID as long);
			User u1 = new User(username:user, password:pass, empresa:empresa.nombre).save(flush:true);
			Role r1 = new Role(authority:"ROLE_ADMIN").save(flush:true);
			UserRole.create(u1, r1, true);
			flash.message="success";
			redirect(action:"newAdmin");
		}
		else{
			flash.message="error";
			redirect(action:"newAdmin");
		}
	}
	
	@Secured(['ROLE_SUPERADMIN'])
	def verAdmins(){
		[admins: User.findAllByEmpresa(session["empresa"])]
	}
}
