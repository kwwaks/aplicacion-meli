package cumples
import mail.EnvioMailService

class EnvioMailsController {
	def envioMailService;
	def indexMail(){
		envioMailService.mandarMail();
	}
}