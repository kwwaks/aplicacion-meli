package cumples

class Empleado {

	String nombre;
	String apellido;
	Date fechaNacimiento;
	String link;
    
    static constraints = {
    	nombre nullable: false;
    	apellido nullable: false;
    	link nullable: true;
    }
}
