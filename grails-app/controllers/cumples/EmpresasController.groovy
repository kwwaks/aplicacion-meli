package cumples
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
}
