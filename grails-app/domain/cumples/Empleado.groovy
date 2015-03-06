package cumples
import java.util.Date

class Empleado {

	String nombre;
	String apellido;
	Date fechaNacimiento;

    static hasMany = [regalos: Regalo];
    
    static constraints = {
    	nombre nullable: false;
    	apellido nullable: false;
    }

    String obtenerFecha(){
    	return this.fechaNacimiento.getDay()  + "/" + this.fechaNacimiento.getYear();
    }
}
