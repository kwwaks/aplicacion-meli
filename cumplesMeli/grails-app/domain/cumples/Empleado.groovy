package cumples

class Empleado {

	String nombre;
	String apellido;
	Date fechaNacimiento;
	String idProducto;
    
    static constraints = {
    	nombre nullable: false;
    	apellido nullable: false;
    	link nullable: true;
    }

    String obtenerFecha(){
    	String res = this.fechaNacimiento.toString();
    	return res.substring(8,10)  + "/" + res.substring(5,7);
    }
}
