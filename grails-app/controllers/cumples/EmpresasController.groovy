package cumples
import grails.plugin.springsecurity.annotation.*

class EmpresasController {
	
	@Secured(['ROLE_SUPERADMIN'])
    def newEmpresa() {
		
	}
	
	@Secured(['ROLE_SUPERADMIN'])
	def newAdmin() {
		[empresas:Empresa.list()];
	}
}
