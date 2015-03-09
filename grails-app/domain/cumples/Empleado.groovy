package cumples
import java.util.Date
import grails.rest.Resource

@Resource
class Empleado {

	String nombre;
	String apellido;
	Date fechaNacimiento;

    static hasMany = [regalos: Regalo];
    
    static constraints = {
    	nombre nullable: false;
    	apellido nullable: false;
    }
}
