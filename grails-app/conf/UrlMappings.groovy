class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller:"Empleados", action:"home")
        "500"(view:'/error')
        "/reporte_regalos_del_mes"(controller:"envioMails", action:"indexMail")
		"/cumples-de-hoy/$empresa"(controller:"empleados", action:"index")
	}
}
