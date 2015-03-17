package cumples
import mail.EnvioMailService
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class EnvioMailsController {

	def envioMailService;
	def indexMail(){
		def empresa = session["empresa"];
		envioMailService.mandarMail(empresa);
	}
}
