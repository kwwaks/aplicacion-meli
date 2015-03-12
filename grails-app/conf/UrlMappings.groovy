class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller:"/empleados/index")
        "500"(view:'/error')
        "/reporte_regalos_del_mes"(controller:"/envioMails/indexMail")
	}
}
