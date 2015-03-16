package cumples
import java.util.Date
import cumples.Extras
import grails.rest.Resource

@Resource(uri= "/empleado")
class Empleado {

	String nombre;
	String apellido;
	Date fechaNacimiento;

	String toString(){
        return  nombre + " " + apellido + " " + Extras.obtenerFecha(fechaNacimiento);
	}

    static hasMany = [regalos: Regalo];
	static belongTo = [empresa: Empresa];
    
    static constraints = {
    	nombre nullable: false;
    	apellido nullable: false;
    }
}
