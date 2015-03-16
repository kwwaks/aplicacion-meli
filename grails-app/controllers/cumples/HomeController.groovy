package cumples

class HomeController {

    def index() {
		[listaEmpresas: Empresa.list()]
	}

}
