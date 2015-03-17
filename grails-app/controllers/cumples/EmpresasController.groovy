package cumples

class EmpresasController {

    def newEmpresa() {
		
	}
	
	def newAdmin() {
		[empresas:Empresa.list()];
	}
}
