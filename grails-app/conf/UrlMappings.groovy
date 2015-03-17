class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller:"home", action:"index")
        "500"(view:'/error')
        "/reporte_regalos_del_mes"(controller:"envioMails", action:"indexMail")
		"/cumples-de-hoy/"(controller:"empleados", action:"index")
	}
}
